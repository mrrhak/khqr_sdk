//
//  StoreLabel.m
//  BakongKHQR
//
//  Created by Seth Sambo on 2/6/21.
//

#import "StoreLabel.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface StoreLabel()

@property (strong, nonatomic) NSString * storeLabel;

@end

@implementation StoreLabel

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id)initWithStoreLabel :(NSString *)storeLabel {
    self = [super init];
    if (self) {
        [self checkException: storeLabel];
        _storeLabel = storeLabel;
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
        
        _storeLabel = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _storeLabel];
        
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *) cStoreLabel {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL checkLength __unused = [Constants checkLengthException: cStoreLabel
                                                         reason: storeLabelLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return STORE_LABEL;
}

-(NSString *) value {
    return _storeLabel;
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
