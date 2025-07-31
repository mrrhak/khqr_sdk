//
//  MerchantName.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/16/20.
//

#import "MerchantName.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface MerchantName()

@property (strong, nonatomic) NSString * merchantName;

@end

@implementation MerchantName

@synthesize tag;
@synthesize value;

#pragma mark - Init
- (id)initWithName:(NSString * _Nonnull)merchantName{
    self = [super init];
    if (self) {
        [self checkException: merchantName];
        _merchantName = [Constants trimWhiteSpace: merchantName];
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
        
        _merchantName = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _merchantName];
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    } else {
        // no throw exception when decoding
        if (Constants.shared.isDecoding) {
            return remaningQR;
        }
        KHQRException * nameRequiredException = [[KHQRException alloc] initWithReason: merchantNameRequired
                                                                            errorCode: [ErrorConstants merchantNameRequiredCode]];
        [nameRequiredException raise];
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *)merchantName {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL _ __unused = [Constants checkEmptyOrNullException: merchantName
                                                    reason: merchantNameRequired];
    BOOL __ __unused = [Constants checkLengthException: merchantName
                                               reason: merchantNameLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return MERCHANT_NAME;
}

-(NSString *) value {
    return _merchantName;
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
