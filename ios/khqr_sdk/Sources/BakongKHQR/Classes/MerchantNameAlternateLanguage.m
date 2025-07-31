//
//  MerchantNameAlternateLanguage.m
//  BakongKHQR
//
//  Created by Seth Sambo on 27/6/23.
//

#import "MerchantNameAlternateLanguage.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface MerchantNameAlternateLanguage()

@property (strong, nonatomic) NSString * alternateName;

@end

@implementation MerchantNameAlternateLanguage

@synthesize tag;
@synthesize value;

#pragma mark - Init

-(id)initWithAlternateName :(NSString *)alternateName {
    self = [super init];
    if (self) {
        // check exception
        [self checkException: alternateName];
        _alternateName = alternateName;
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

        _alternateName = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _alternateName];

        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *) cAlternateName {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    // required field check
    BOOL requiredException __unused = [Constants checkEmptyOrNullException: cAlternateName reason: merchantNameAlternateLanguageRequired];
    
    // length check
    BOOL checkLength __unused = [Constants checkLengthException: cAlternateName reason: merchantNameAlternateLanguageLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return MERCHANT_NAME_ALTERNATE_LANGUAGE;
}

-(NSString *) value {
    return _alternateName;
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end

