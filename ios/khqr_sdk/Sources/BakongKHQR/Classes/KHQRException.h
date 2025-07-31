//
//  KHQRError.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/16/20.
//

#import <Foundation/Foundation.h>
#import "Enums.h"

@protocol KHQRExceptionProtocol <NSObject>

@property (nonatomic, readonly) KHQRExceptionReasons reason;
@property (nonatomic, readonly) NSString * _Nonnull message;
@property (nonatomic, readonly) NSNumber * _Nonnull errorCode;

@end

@interface KHQRException : NSException<KHQRExceptionProtocol>

- (nonnull instancetype)initWithReason:(KHQRExceptionReasons)reason
                             errorCode:(NSNumber *_Nullable)code;

- (BOOL) isEqualTo: (KHQRException *_Nonnull)exception;

@end

