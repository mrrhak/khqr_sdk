//
//  MerchantCityAlternateLanguage.m
//  BakongKHQR
//
//  Created by Seth Sambo on 27/6/23.
//

#import "MerchantCityAlternateLanguage.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface MerchantCityAlternateLanguage()

@property (strong, nonatomic) NSString * alternateCity;

@end

@implementation MerchantCityAlternateLanguage

@synthesize tag;
@synthesize value;

#pragma mark - Init

-(id)initWithAlternateCity :(NSString *)alternateCity {
    self = [super init];
    if (self) {
        // check exception
        [self checkException: alternateCity];
        _alternateCity = alternateCity;
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

        _alternateCity = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _alternateCity];

        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *) cAlternateCity {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    // length check
    BOOL checkLength __unused = [Constants checkLengthException: cAlternateCity reason: merchantCityAlternateLanguageLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return MERCHANT_CITY_ALTERNATE_LANGUAGE;
}

-(NSString *) value {
    return _alternateCity;
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
