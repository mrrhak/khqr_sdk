//
//  FormatIndicator.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import "FormatIndicator.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface FormatIndicator()

@property (strong, nonatomic) NSString * version;

@end

@implementation FormatIndicator

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id)initWithVersion :(NSString *)version {
    self = [super init];
    if (self) {
        [self checkException: version];
        _version = version;
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
        
        _version = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _version];
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    } else {
        // no throw exception when decoding
        if (Constants.shared.isDecoding) {
            return remaningQR;
        }
        KHQRException * requiredException = [[KHQRException alloc] initWithReason: formatIndicatorRequired
                                                                        errorCode: [ErrorConstants formatIndicatorRequiredCode]];
        [requiredException raise];
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *)cVersion {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL requiredException __unused = [Constants checkEmptyOrNullException: cVersion reason: formatIndicatorRequired];
    BOOL lengthException __unused = [Constants checkLengthException: cVersion reason: formatIndicatorLengthInvalid];
}

#pragma mark - Protocols
-(NSString *) tag {
    return PAYLOAD_FORMAT_INDICATOR;
}

-(NSString *) value {
    return _version;
}

-(NSString *) toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end

