//
//  ReserveForUse.m
//  BakongKHQR
//
//  Created by Seth Sambo on 1/11/21.
//

#import "ReserveForUse.h"
#import "KHQRMerchantPresentedCodes.h"
#import "KHQRTimestamp.h"
#import "Constants.h"

@interface ReserveForUse()

@property (strong, nonatomic) NSString * milliseconds;
@property (strong, nonatomic) KHQRTimestamp * generatedTimestamp;
@property (strong, nonatomic) KHQRTimestamp * expirationTimestamp;

@end

@implementation ReserveForUse

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id)initWithMilliseconds:(NSString *)millisecond {
    self = [super init];
    if (self) {
        [self checkException: millisecond];
        _milliseconds = millisecond;
    }
    return self;
}

#pragma mark - Decode
-(NSString *) decodeWithQr: (NSString *)qr {
    NSString * tagFromQR = [qr substringToIndex: self.tag.length];
    NSString * remaningQR = @"";
        
    if ([tagFromQR isEqualToString: self.tag]) {
        remaningQR = [Constants replaceString: qr withEmptyStringToIndex: 2];
        
        // extract length
        NSInteger valueLength = [Constants subString: remaningQR toIndex: 2].intValue;
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: 2];
        NSString * reserveForUseString = [Constants subString: remaningQR toIndex: valueLength];
        
        while (![reserveForUseString isEqualToString: @""]) {
            NSString * subTag = [Constants subString: reserveForUseString toIndex: 2];
            
            KHQRTimestamp * timestamp = [[KHQRTimestamp alloc] initWithTag: subTag];
            reserveForUseString = [timestamp decodeWithQr: reserveForUseString];
            if ([timestamp.tag isEqualToString: @"00"]) {
                _generatedTimestamp = timestamp;
            } else if ([timestamp.tag isEqualToString: @"01"]) {
                _expirationTimestamp = timestamp;
            }
        }
        
        if (_expirationTimestamp) {
            long long currentMilliseconds = (long long)([[NSDate date] timeIntervalSince1970] * 1000.0);
            if (_expirationTimestamp.value.longLongValue < currentMilliseconds) {
                // no throw exception when decoding
                if (Constants.shared.isDecoding) {
                    return remaningQR;
                }
                KHQRException * requiredException = [[KHQRException alloc] initWithReason: khqrExpired
                                                                                errorCode: [ErrorConstants khqrExpiredCode]];
                [requiredException raise];
            } else {
                _milliseconds = _expirationTimestamp.value;
                remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
                return remaningQR;
            }
        } else {
            if (Constants.shared.isDecoding) {
                return remaningQR;
            }
            KHQRException * requiredException = [[KHQRException alloc] initWithReason: expirationTimestampRequired
                                                                            errorCode: [ErrorConstants expirationTimestampRequiredCode]];
            [requiredException raise];
        }
    }
    return qr;
}


#pragma mark - Helper functions
-(void) checkException: (NSString *)cTimestamp {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return ;
    }
    BOOL requiredException __unused = [Constants checkEmptyOrNullException: cTimestamp reason: expirationTimestampRequired];
    BOOL lengthException __unused = [Constants checkLengthException: cTimestamp reason: expirationTimestampLengthInvalid];
}

-(NSString *) globalUniqueIdentifierTag {
    return RFU_GLOBALLY_UNIQUE_IDENTIFIER;
}

-(NSString *) expirationTimestampSubTag {
    return RFU_EXPIRATION_TIMESTAMP;
}

#pragma mark - Protocol
-(NSString *) tag {
    return RFU_TAG;
}

-(NSString *) value {
    return _milliseconds;
}

- (NSString *)toString {
    NSString * uniqueIdentifierTag = [self globalUniqueIdentifierTag];
    NSString * expirationTag = [self expirationTimestampSubTag];
    
    long long currentMilliseconds = (long long)([[NSDate date] timeIntervalSince1970] * 1000.0);
    long long expirationMilliseconds = self.value.longLongValue;
    
    if (expirationMilliseconds < currentMilliseconds) {
        KHQRException * requiredException = [[KHQRException alloc] initWithReason: expirationTimestampInThePast
                                                                        errorCode: [ErrorConstants expirationTimestampInThePastCode]];
        [requiredException raise];
    }
    
    KHQRTimestamp * currentTimestampObj = [[KHQRTimestamp alloc] initWithTimestamp: currentMilliseconds tag: uniqueIdentifierTag];
    NSString * currentTimestampString =  [currentTimestampObj toString];
    
    KHQRTimestamp * expirationTimestampObj = [[KHQRTimestamp alloc] initWithTimestamp: expirationMilliseconds tag: expirationTag];
    NSString * expirationTimestampString = [expirationTimestampObj toString];
    
    long totalLengthCount = currentTimestampString.length + expirationTimestampString.length;
    
    NSString * totalLengthString = [NSString stringWithFormat:@"%02ld", totalLengthCount];
    NSString * toStringValue = [NSString stringWithFormat: @"%@%@%@%@",
                               self.tag, totalLengthString, currentTimestampString, expirationTimestampString];
    return toStringValue;
}

- (NSString *)getGeneratedTimestamp {
    return _generatedTimestamp.value;
}

- (NSString *)getExpirationTimestamp {
    return [_expirationTimestamp value];
}

@end
