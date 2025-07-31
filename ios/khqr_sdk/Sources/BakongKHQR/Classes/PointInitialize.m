//
//  PointInitialize.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import "PointInitialize.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface PointInitialize()

@property (strong, nonatomic) NSString * qrType;

@end

@implementation PointInitialize

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id)initWithQrType :(NSString *)qrType {
    self = [super init];
    if (self) {
        [self checkException: qrType];
        _qrType = qrType;
    }
    return self;
}

#pragma mark - Decode
-(NSString *) decodeWithQr: (NSString *)qr {
    NSString * tagFromQR = [Constants subString: qr toIndex: 2];
    NSString * remaningQR = @"";
    
    if ([tagFromQR isEqualToString: self.tag]) {
        remaningQR =  [Constants replaceString: qr withEmptyStringToIndex: 2];
        
        NSInteger valueLength = [Constants subString: remaningQR toIndex: 2].intValue;
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: 2];
        
        _qrType = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _qrType];
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *)cQrType {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL lengthException __unused = [Constants checkLengthException: cQrType reason: pointOfInitializeLengthInvalid];
    if (![cQrType isEqualToString: @"11"] && ![cQrType isEqualToString: @"12"]) {
        KHQRException * requiredException = [[KHQRException alloc] initWithReason: pointInitiationMethodInvalid
                                                                        errorCode: [ErrorConstants pointInitiationMethodInvalidCode]];
        [requiredException raise];
    }
}

#pragma mark - Protocol
-(NSString *) tag {
    return POINT_OF_INITIATION_METHOD;
}

-(NSString *) value {
    return _qrType;
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
