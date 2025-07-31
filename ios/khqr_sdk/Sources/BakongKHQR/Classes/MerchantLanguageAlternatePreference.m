//
//  MerchantAlternateLanguagePreference.m
//  BakongKHQR
//
//  Created by Seth Sambo on 27/6/23.
//

#import "MerchantLanguageAlternatePreference.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface MerchantLanguageAlternatePreference()

@property (strong, nonatomic) NSString * languagePreference;

@end

@implementation MerchantLanguageAlternatePreference

@synthesize tag;
@synthesize value;

#pragma mark - Init

-(id)initWithLanguagePreference :(NSString *)languagePreference {
    self = [super init];
    if (self) {
        // check exception
        [self checkException: languagePreference];
        _languagePreference = languagePreference;
    }
    return self;
}

#pragma mark - Decode
-(NSString *) decodeWithQr: (NSString *)qr {
    NSString * tagFromQR =[Constants subString: qr toIndex: 2];
    NSString * remaningQR = @"";

    if ([tagFromQR isEqualToString: self.tag]) {
        remaningQR =[Constants replaceString: qr withEmptyStringToIndex: 2];

        NSInteger valueLength = [Constants subString: remaningQR toIndex: 2].intValue;
        remaningQR =  [Constants replaceString: remaningQR withEmptyStringToIndex: 2];

        _languagePreference = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _languagePreference];

        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *) cLanguagePreference {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    // required field check
    BOOL requiredException __unused = [Constants checkEmptyOrNullException: cLanguagePreference reason: merchantLanguagePreferenceRequired];
    
    // length check
    BOOL checkLength __unused = [Constants checkLengthException: cLanguagePreference reason: merchantLanguagePreferenceLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return MERCHANT_LANGUAGE_PREFERENCE;
}

-(NSString *) value {
    return _languagePreference;
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end

