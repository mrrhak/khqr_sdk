//
//  KHQRTimestamp.m
//  BakongKHQR
//
//  Created by Sang Chantha on 27/9/24.
//

#import "KHQRTimestamp.h"
#import "Constants.h"

@interface KHQRTimestamp()
@property (nonatomic, strong) NSString *tagName;
@property (nonatomic) long long timestamp;
@end

@implementation KHQRTimestamp

@synthesize tag;
@synthesize value;

-(id)initWithTag:(NSString *)tag {
    self = [super init];
    if (self) {
        _tagName = tag;
    }
    return self;
}

- (id)initWithTimestamp:(long long)timestamp tag:(NSString *)tag {
    self = [super init];
    if (self) {
        _timestamp = timestamp;
        _tagName = tag;
    }
    return self;
}

- (NSString *)decodeWithQr:(NSString *)qr {
    NSString * tagFromQR = [Constants subString: qr toIndex: 2];
    NSString * remaningQR = @"";
    
    if ([tagFromQR isEqualToString: self.tag]) {
        remaningQR = [Constants replaceString: qr withEmptyStringToIndex: 2];
        
        NSInteger valueLength = [Constants subString: remaningQR toIndex: 2].intValue;
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: 2];
        
        _timestamp = [[Constants subString: remaningQR toIndex: valueLength] longLongValue];
        [self checkException: self.value];
        
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

-(void) checkException: (NSString *)cTimestamp {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL requiredException __unused = [Constants checkEmptyOrNullException: cTimestamp reason: expirationTimestampRequired];
    BOOL lengthException __unused = [Constants checkLengthException: cTimestamp reason: expirationTimestampLengthInvalid];
}

- (NSString *)tag {
    return _tagName;
}

- (NSString *)value {
    return [NSString stringWithFormat: @"%2lld", _timestamp];;
}

- (NSString *)toString {
    NSString * lenghtString = [NSString stringWithFormat: @"%2ld", self.value.length];
    NSString * toStringValue = [NSString stringWithFormat: @"%@%@%@", self.tag, lenghtString, self.value];
    return toStringValue;
}

@end
