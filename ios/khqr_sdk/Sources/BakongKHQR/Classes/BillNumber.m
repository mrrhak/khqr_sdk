//
//  BillNumber.m
//  BakongKHQR
//
//  Created by Seth Sambo on 2/6/21.
//

#import "BillNumber.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface BillNumber()

@property (strong, nonatomic) NSString * billNumber;

@end

@implementation BillNumber

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id)initWithBillNumber :(NSString *)billNumber {
    self = [super init];
    if (self) {
        [self checkException: billNumber];
        _billNumber = billNumber;
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

        _billNumber = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _billNumber];
        
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *) cBillNumber {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL checkLength __unused = [Constants checkLengthException: cBillNumber
                                                         reason: billNumberLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return BILL_NUMBER;
}

-(NSString *) value {
    return _billNumber;
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
