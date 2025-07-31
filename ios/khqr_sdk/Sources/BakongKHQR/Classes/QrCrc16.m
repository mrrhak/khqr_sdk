//
//  QrCrc16.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/9/20.
//

#import "QrCrc16.h"

@implementation QrCrc16

#pragma mark - Init
- (id)initWithCode:(NSString *)qrCode crcCode:(NSString *)crcCode {
    self = [super init];
    if (self) {
        _qrCode = qrCode;
        _crcCode = crcCode;
    }
    return self;
}

#pragma mark - Helper functions
-(BOOL)isMatchCRC:(NSString *)crcCode {
    return _crcCode == crcCode;
}

@end
