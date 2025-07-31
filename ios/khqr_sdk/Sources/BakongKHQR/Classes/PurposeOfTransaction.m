//
//  PurposeOfTransaction.m
//  BakongKHQR
//
//  Created by Seth Sambo on 23/6/23.
//

#import "PurposeOfTransaction.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface PurposeOfTransaction()

@property (strong, nonatomic) NSString * purpose;

@end

@implementation PurposeOfTransaction

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id)initWithPurpose :(NSString *)purpose {
    self = [super init];
    if (self) {
        [self checkException: purpose];
        _purpose = purpose;
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

        _purpose = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _purpose];

        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *) cPurpose {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL checkLength __unused = [Constants checkLengthException: cPurpose
                                reason: purposeOfTransactionLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return PURPOSE_OF_TRANSACTION;
}

-(NSString *) value {
    return _purpose;
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
