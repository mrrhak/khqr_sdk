//
//  AcquiringBank.h
//  BakongKHQR
//
//  Created by Seth Sambo on 7/6/21.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"
#import "Enums.h"

@interface AcquiringBank : NSObject <TagLengthStringProtocol>

-(id _Null_unspecified)initWithAcquiringBank  :(NSString * _Nonnull)bank;
-(NSString * _Nonnull) decodeWithQr: (NSString * _Nonnull)qr;

@end

