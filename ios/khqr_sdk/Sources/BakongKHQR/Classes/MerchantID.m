//
//  MerchantID.m
//  BakongKHQR
//
//  Created by Seth Sambo on 7/6/21.
//

#import "MerchantID.h"
#import "KHQRMerchantPresentedCodes.h"
#import "KHQRException.h"
#import "Constants.h"

@interface MerchantID()

@property (strong, nonatomic) NSString * merchantId;


@end

@implementation MerchantID 

#pragma mark - Init
- (id)initWithId:(NSString *)merchantId {
    self = [super init];
    if (self) {
        NSString * merchantIdTrimValue = [Constants trimWhiteSpace: merchantId];
        [self checkException: merchantIdTrimValue];
        _merchantId = merchantIdTrimValue;
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

        _merchantId = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _merchantId];
        
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *)merchantId {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL _ __unused = [Constants checkEmptyOrNullException: merchantId
                                                    reason: merchantIdrequired];
    BOOL __ __unused = [Constants checkLengthException: merchantId
                                               reason: merchantIdLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return MERCHANT_ID;
}

-(NSString *) value {
    return _merchantId;
}

-(NSString *) toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
