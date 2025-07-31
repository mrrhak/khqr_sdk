//
//  CRCValidation.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/22/20.
//

#import "CRCValidation.h"

@implementation CRCValidation

-(id)initWithStatus: (BOOL)status {
    self = [super init];
    if (self) {
        _valid = status;
    }
    return self;
}

-(BOOL)isEqualTo: (CRCValidation * _Nonnull)crcValidation {
    return _valid == crcValidation.valid ;
}

@end
