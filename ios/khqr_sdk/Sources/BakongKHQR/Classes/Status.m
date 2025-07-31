//
//  Status.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/21/20.
//

#import "Status.h"

@implementation Status

-(id _Nonnull )initWithCode :(NSNumber * _Nonnull)code
                   errorCode: (NSNumber * _Nullable)errorCode
                     message: (NSString * _Nullable)message {
    self = [super init];
    if (self) {
        _code = code;
        _errorCode = errorCode;
        _message = message;
    }
    return self;
}

-(BOOL)isEqualTo: (Status *)status {
    return (status.code == _code &&
            status.errorCode == _errorCode &&
            status.message == _message);
}

@end
