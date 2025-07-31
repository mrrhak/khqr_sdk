//
//  MerchantLanguageTemplate.m
//  BakongKHQR
//
//  Created by Seth Sambo on 27/6/23.
//

#import "MerchantLanguageTemplate.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface MerchantLanguageTemplate()

@property (nonatomic, strong) MerchantLanguageAlternatePreference * languagePreference;
@property (nonatomic, strong) MerchantNameAlternateLanguage * merchantName;
@property (nonatomic, strong) MerchantCityAlternateLanguage * merchantCity;

@end

@implementation MerchantLanguageTemplate

@synthesize tag;
@synthesize value;

#pragma mark - Inits
- (id)initWithLanguagePreference:(NSString *)languagePreference merchantNameAlternateLanguage:(NSString *)merchantName merchantCityAlternateLanguage:(NSString *)merchantCity {
    self = [super init];
    if (self) {
        [self setMerchantLanguageAlternatePreference: languagePreference];
        [self setMerchantNameAlternateLanguage: merchantName];
        [self setMerchantCityAlternateLanguage: merchantCity];
    }
    return self;
}

#pragma mark - Decode
- (NSString *)decodeWithQr:(NSString *)qr {
    NSString * tagFromQR = [Constants subString: qr toIndex: 2];
    NSString * remaningQR = @"";
    
    [self checkDuplicateSubTag: qr];
    
    if ([tagFromQR isEqualToString: self.tag]) {
        remaningQR = [Constants replaceString: qr withEmptyStringToIndex: 2];
        
        NSInteger valueLength = [Constants subString: remaningQR toIndex: 2].intValue;
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: 2];
        
        [self decodeSubData: [Constants subString: remaningQR toIndex: valueLength]];

        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

-(void)decodeSubData: (NSString *) qr{
    NSString * remaningTag = qr;
    NSString * previousTag = @"0";
    BOOL isContinue = TRUE;
    do {
        NSString * tag = [Constants subString:remaningTag toIndex: 2];
        remaningTag = [Constants replaceString:remaningTag withEmptyStringToIndex: 2];
        NSString * length = [Constants subString:remaningTag toIndex: 2];
        remaningTag = [Constants replaceString: remaningTag withEmptyStringToIndex: 2];
        NSString * value = [Constants subString:remaningTag toIndex: length.intValue];
        remaningTag = [Constants replaceString: remaningTag withEmptyStringToIndex: length.intValue];
        NSString * tagLengthValue = [NSString stringWithFormat:@"%@%@%@", tag, length, value];
    
//        NSLog(@"tag: %@ | tagLengthValue: %@", tag, tagLengthValue);
        if ([tag isEqualToString: @"00"]) { // language preference
            if (_languagePreference == NULL) {
                _languagePreference = [[MerchantLanguageAlternatePreference alloc] init];
            }
            [_languagePreference decodeWithQr: tagLengthValue];
        }
        else if ([tag isEqualToString: @"01"]) { // Merchant name alternate language
            if (_merchantName == NULL) {
                _merchantName = [[MerchantNameAlternateLanguage alloc] init];
            }
            [_merchantName decodeWithQr: tagLengthValue];
        }
        else if ([tag isEqualToString: @"02"]) { // Merchant city alternate language
            if (_merchantCity == NULL) {
                _merchantCity = [[MerchantCityAlternateLanguage alloc] init];
            }
            [_merchantCity decodeWithQr: tagLengthValue];
        }
        previousTag = tag;
        if (IsEmpty(remaningTag)) {
            isContinue = false;
        }
    } while (isContinue);
}

#pragma mark - Helper function
-(void) checkDuplicateSubTag: (NSString *)qr {
    if (Constants.shared.isDecoding) {
        return;
    }
    NSString * remaningTag = qr;
    // remove account tag, total length
    remaningTag = [Constants replaceString:remaningTag withEmptyStringToIndex: 4];
        
    if (IsEmpty(remaningTag) == FALSE) {
        NSString * previousTag = @"0";
        NSMutableDictionary * taglist = [[NSMutableDictionary alloc] init];
        BOOL isContinue = TRUE;
        do {
            NSString * tag = [Constants subString:remaningTag toIndex: 2];
            remaningTag = [Constants replaceString:remaningTag withEmptyStringToIndex: 2];
            NSString * length = [Constants subString:remaningTag toIndex: 2];
            remaningTag = [Constants replaceString: remaningTag withEmptyStringToIndex: 2];
            NSString * value = [Constants subString:remaningTag toIndex: length.intValue];
            remaningTag = [Constants replaceString: remaningTag withEmptyStringToIndex: length.intValue];
            NSString * tagLengthValue = [NSString stringWithFormat:@"%@%@%@", tag, length, value];
        
//            NSLog(@"%@ | %@", tag, tagLengthValue);
            if ([taglist objectForKey: tag]) {
                // key already existed found duplicated tag, throw error invalid qr
                KHQRException * exception = [[KHQRException alloc] initWithReason:
                                             qrInvalid
                                        errorCode: [ErrorConstants qrInvalidCode]];
                [exception raise];
            }
            [taglist setValue:tagLengthValue forKey: tag];
            previousTag = tag;
            if (IsEmpty(remaningTag)) {
                isContinue = false;
            }
        } while (isContinue);
    }
}

#pragma mark - Protocol
-(NSString *) tag {
    return MERCHANT_LANGUAGE_TEMPLATE;
}

-(NSString *) value {
    NSMutableString * payload = [[NSMutableString alloc] init];
    if (_languagePreference) {
        [payload appendString: [_languagePreference toString]];
    }
    if (_merchantName) {
        [payload appendString: [_merchantName toString]];
    }
    if (_merchantCity) {
        [payload appendString: [_merchantCity toString]];
    }
    return payload;
}

- (NSString *)toString {
    if (IsEmpty(_languagePreference) &&
        IsEmpty(_merchantName) &&
        IsEmpty(_merchantCity)) {
        return @"";
    }
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
    return @"";
}


#pragma mark - Getter / Setter

-(void)setMerchantLanguageAlternatePreference: (NSString *)languagePreference {
    _languagePreference = [[MerchantLanguageAlternatePreference alloc] initWithLanguagePreference: languagePreference];
}
-(void)setMerchantNameAlternateLanguage: (NSString *)merchantName {
    _merchantName = [[MerchantNameAlternateLanguage alloc] initWithAlternateName: merchantName];
}
-(void)setMerchantCityAlternateLanguage: (NSString *)merchantCity {
    _merchantCity = [[MerchantCityAlternateLanguage alloc] initWithAlternateCity: merchantCity];
}

-(NSString *) getMerchantLanguageAlternatePreference {
    return [_languagePreference value];
}
-(NSString *) getMerchantNameAlternateLanguage {
    return [_merchantName value];
}
-(NSString *) getMerchantCityAlternateLanguage {
    return [_merchantCity value];
}



@end
