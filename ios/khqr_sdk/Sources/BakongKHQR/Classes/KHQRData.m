//
//  KHQRData.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/21/20.
//

#import "KHQRData.h"
#import "NSString+md5.h"

@implementation KHQRData

-(id)initWithQR: (NSString *)qr {
    self = [super init];
    if (self) {
        _qr = qr;
        _md5 = [qr md5];
    }
    return self;
}

@end
