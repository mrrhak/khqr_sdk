//
//  CountryCode.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import "CountryCode.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface CountryCode()

@property (strong, nonatomic) NSString * countryCode;

@end

@implementation CountryCode

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id)initWithCountryCode:(NSString *)countryCode {
    self = [super init];
    if (self) {
        [self checkException: countryCode];
        _countryCode = countryCode;
    }
    return self;
}

#pragma mark - Decode
-(NSString *) decodeWithQr: (NSString *)qr {
    NSString * tagFromQR = [Constants subString: qr toIndex: 2];
    NSString * remaningQR = @"";
    
    if ([tagFromQR isEqualToString: self.tag]) {
        remaningQR = [Constants replaceString: qr withEmptyStringToIndex: 2];
        
        NSInteger valueLength = [Constants subString: remaningQR toIndex: 2].intValue;
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: 2];
        
        _countryCode = [Constants subString: remaningQR toIndex:valueLength];
        [self checkException: _countryCode];
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    } else {
        // no throw exception when decoding
        if (Constants.shared.isDecoding) {
            return remaningQR;
        }
        KHQRException * requiredException = [[KHQRException alloc] initWithReason: countryCodeRequired
                                                                        errorCode: [ErrorConstants countryCodeRequiredCode]];
        [requiredException raise];
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *)cCountryCode {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL requiredException __unused = [Constants checkEmptyOrNullException: cCountryCode reason: countryCodeRequired];
    BOOL lengthException __unused = [Constants checkLengthException: cCountryCode reason: countryCodeLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return COUNTRY_CODE;
}

-(NSString *) value {
    return _countryCode;
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
