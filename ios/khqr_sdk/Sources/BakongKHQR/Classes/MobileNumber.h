//
//  MobileNumber.h
//  BakongKHQR
//
//  Created by Seth Sambo on 7/6/21.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"
#import "Enums.h"

@interface MobileNumber : NSObject <TagLengthStringProtocol>

-(id _Null_unspecified)initWithMobileNumber  :(NSString * _Nonnull)mobileNumber;
-(NSString * _Nonnull) decodeWithQr: (NSString * _Nonnull)qr;

@end


