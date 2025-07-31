//
//  MerchantID.h
//  BakongKHQR
//
//  Created by Seth Sambo on 7/6/21.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"
#import "Enums.h"

@interface MerchantID : NSObject <TagLengthStringProtocol>

-(id _Null_unspecified)initWithId  :(NSString * _Nonnull)merchantId;
-(NSString * _Nonnull) decodeWithQr: (NSString * _Nonnull)qr;

@end

