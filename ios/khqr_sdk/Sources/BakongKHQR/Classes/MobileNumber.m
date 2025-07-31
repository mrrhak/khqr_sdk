//
//  MobileNumber.m
//  BakongKHQR
//
//  Created by Seth Sambo on 7/6/21.
//

#import "MobileNumber.h"
#import "KHQRMerchantPresentedCodes.h"
#import "KHQRException.h"
#import "Constants.h"

@interface MobileNumber()

@property (strong, nonatomic) NSString * mobileNumber;

@end

@implementation MobileNumber
@synthesize tag;
@synthesize value;

#pragma mark - Init
- (id)initWithMobileNumber:(NSString *)mobileNumber {
    self = [super init];
    if (self) {
        NSString * mobileNumberTrimValue = [Constants trimWhiteSpace: mobileNumber];
        [self checkException: mobileNumberTrimValue];
        _mobileNumber = mobileNumber;
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

        _mobileNumber = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _mobileNumber];
        
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *)mobileNumber {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL __ __unused = [Constants checkLengthException: mobileNumber
                                               reason: mobileNumberLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return MOBILE_NUMBER;
}

-(NSString *) value {
    return _mobileNumber;
}

-(NSString *) toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
