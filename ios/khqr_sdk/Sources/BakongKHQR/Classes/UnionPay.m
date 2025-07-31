//
//  UnionPay.m
//  BakongKHQR
//
//  Created by Seth Sambo on 28/6/23.
//

#import "UnionPay.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface UnionPay()

@property (strong, nonatomic) NSString * upiAccountInformation;
@property CurrencyType currencyType;

@end

@implementation UnionPay

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id)initWithUpiAccountInformation:(NSString *)upiAccountInformation currencyType: (CurrencyType)currencyType {
    self = [super init];
    if (self) {
        _upiAccountInformation = upiAccountInformation;
        _currencyType = currencyType;
        [self checkException: upiAccountInformation currencyType: currencyType];
    }
    return self;
}

#pragma mark - Decode
-(NSString *) decodeWithQr: (NSString *)qr {
    NSString * tagFromQR = [Constants subString: qr toIndex: 2];
    NSString * remaningQR = @"";
    if ([tagFromQR isEqualToString: self.tag]) {
        remaningQR = [qr stringByReplacingCharactersInRange: NSMakeRange(0, 2) withString: @""];

        NSInteger valueLength = [Constants subString: remaningQR toIndex: 2].intValue;
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: 2];
        
        _upiAccountInformation = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException:_upiAccountInformation currencyType:_currencyType];
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex:valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *)cUpiAccountInformation currencyType: (CurrencyType)currencyType {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL lengthException __unused = [Constants checkLengthException: cUpiAccountInformation reason: upiAccountInformationLengthInvalid];
    BOOL currencyException __unused = [Constants checkNotSupportUSDException: currencyType reason: upiAccountInformationNotSupportUSD];
}

#pragma mark - Protocols
-(NSString *) tag {
    return UNION_PAY;
}

-(NSString *) value {
    return _upiAccountInformation;
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
