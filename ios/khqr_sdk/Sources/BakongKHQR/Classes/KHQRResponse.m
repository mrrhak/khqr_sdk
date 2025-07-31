//
//  KHQRResponse.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/21/20.
//

#import "KHQRResponse.h"

@implementation KHQRResponse


-(id)initWithErrorCode :(NSNumber * _Nullable)errorCode
                message: (NSString *)message
                   data: (id<ResponseProtocol> _Nullable)data{
    self = [super init];
    if (self) {
        _status = [[Status alloc] initWithCode: [NSNumber numberWithInt: errorCode ? 1 : 0]
                                     errorCode: errorCode
                                       message: message];
        _data = data;
    }
    return self;
}

- (BOOL)isEqualTo: (KHQRResponse *)khqrResponse {
    return [khqrResponse.status isEqualTo: _status];
//            [khqrResponse.data isEqual: _data])
}

@end
