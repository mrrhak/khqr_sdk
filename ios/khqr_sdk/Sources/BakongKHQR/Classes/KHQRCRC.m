//
//  CRC.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/15/20.
//

#import "KHQRCRC.h"
#import "KHQRMerchantPresentedCodes.h"
#import "NSData+CRC-16CCITT.h"
#import "Constants.h"

@interface KHQRCRC()

@property (strong, nonatomic) NSString* payload;

@end

@implementation KHQRCRC

@synthesize tag;
@synthesize value;

#pragma mark - Init

-(id)initWithPayloadString :(NSString *)payload {
    self = [super init];
    if (self) {
        _payload =  payload.copy;
    }
    return self;
}

#pragma mark - Decode
-(NSString *) decodeWithQr: (NSString *)qr {
    if (qr.length < 2) { [self throwRequiredException]; }
    NSString * tagFromQR = [Constants subString: qr toIndex: 2];
    NSString * remaningQR = @"";
    if ([tagFromQR isEqualToString: self.tag]) {
        remaningQR = [Constants replaceString: qr withEmptyStringToIndex: 2];

        NSInteger valueLength = [Constants subString: remaningQR toIndex: 2].intValue;
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: 2];

        [self checkCRCException: [Constants subString: remaningQR toIndex: valueLength]];
        
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    } else {
        [self throwRequiredException];
    }
    return qr;
}

#pragma mark - Setter
-(void)setQRString: (NSString *)payload {
    _payload = payload.copy;
}

#pragma mark - Helper function
-(void) throwRequiredException {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    KHQRException * exception = [[KHQRException alloc] initWithReason: crcRequired
                                                            errorCode: [ErrorConstants crcRequiredCode]];
    [exception raise];
}

-(NSString *) generateCrcCodeOfString: (NSString *)payload {
    NSData *bytes = [payload dataUsingEncoding: NSUTF8StringEncoding];
    NSString* crcCode = [NSString stringWithFormat: @"%04X", [bytes crc16Checksum]];
    return crcCode;
}

-(BOOL) checkCRCException: (NSString *)crc {
    // no throw exception when decoding
//    if (Constants.shared.isDecoding) {
//        return FALSE;
//    }
    NSString* generatedCrc = [self generateCrcCodeOfString: _payload];
    BOOL _ __unused = [Constants checkLengthException: crc reason: crcLengthInvalid];
    if (![[generatedCrc lowercaseString] isEqualToString: [crc lowercaseString]]){
        KHQRException * exception = [[KHQRException alloc] initWithReason: qrInvalid
                                                                errorCode: [ErrorConstants qrInvalidCode]];
        [exception raise];
    }
    return TRUE;
}

-(BOOL) checkPayloadException {
    if (IsEmpty(_payload)){
//        || [_payload rangeOfString: @"6304"].location == NSNotFound)
        KHQRException * exception = [[KHQRException alloc] initWithReason: qrInvalid
                                                                errorCode: [ErrorConstants qrInvalidCode]];
        [exception raise];
    }
    return TRUE;
}

#pragma mark - Protocol
-(NSString *) tag {
    return CRC_TAG;
}

-(NSString *) value {
    BOOL payloadException __unused = [self checkPayloadException];
    return [self generateCrcCodeOfString: _payload];
}

- (NSString *)toString {
    BOOL payloadException __unused = [self checkPayloadException];
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}


@end
