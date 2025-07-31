//
//  AccountInformation.m
//  BakongKHQR
//
//  Created by Seth Sambo on 8/30/21.
//
#import "AccountInformation.h"
#import "KHQRMerchantPresentedCodes.h"
#import "KHQRException.h"
#import "Constants.h"

@interface AccountInformation()

@property (strong, nonatomic) NSString * accountInfo;


@end

@implementation AccountInformation

#pragma mark - Init
-(id _Null_unspecified)initWithinfo  :(NSString * _Nonnull)accountInfo {
    self = [super init];
    if (self) {
        NSString * accountInfoTrimValue = [Constants trimWhiteSpace: accountInfo];
        [self checkException: accountInfoTrimValue];
        _accountInfo = accountInfoTrimValue;
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

        _accountInfo = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _accountInfo];
        
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *)accountInfo {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL __ __unused = [Constants checkLengthException: accountInfo
                                               reason: accountInfoLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return ACCOUNT_INFORMATION;
}

-(NSString *) value {
    return _accountInfo;
}

-(NSString *) toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
