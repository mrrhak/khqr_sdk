//
//  AccountInformation.h
//  BakongKHQR
//
//  Created by Seth Sambo on 8/30/21.
//
#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"
#import "Enums.h"

@interface AccountInformation : NSObject <TagLengthStringProtocol>

-(id _Null_unspecified)initWithinfo  :(NSString * _Nonnull)accountInfo;
-(NSString * _Nonnull) decodeWithQr: (NSString * _Nonnull)qr;

@end
