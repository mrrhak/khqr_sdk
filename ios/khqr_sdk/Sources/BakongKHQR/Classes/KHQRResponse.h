//
//  KHQRResponse.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/21/20.
//

#import <Foundation/Foundation.h>
#import "ResponseProtocol.h"
#import "Status.h"

@interface KHQRResponse: NSObject

@property Status * _Nullable status;
@property (strong, nonatomic) id<ResponseProtocol> _Nullable data;

-(id _Nonnull )initWithErrorCode :(NSNumber * _Nullable)errorCode
                          message: (NSString *_Nullable)message
                             data: (id<ResponseProtocol> _Nullable) data;

- (BOOL)isEqualTo: (KHQRResponse *_Nonnull)khqrResponse;
    
@end
