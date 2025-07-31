//
//  Status.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/21/20.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject

@property NSNumber * _Nonnull code;
@property NSNumber * _Nullable errorCode;
@property (strong, nullable) NSString * message;

-(id _Nonnull )initWithCode :(NSNumber * _Nonnull)code
                   errorCode: (NSNumber * _Nullable)errorCode
                     message: (NSString * _Nullable)message;

-(BOOL)isEqualTo: (Status * _Nonnull)status;

@end
