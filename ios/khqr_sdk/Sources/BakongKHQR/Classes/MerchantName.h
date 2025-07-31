//
//  MerchantName.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/16/20.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface MerchantName : NSObject<TagLengthStringProtocol>

-(id _Null_unspecified)initWithName :(NSString * _Nonnull)merchantName;
-(NSString *) decodeWithQr: (NSString *)qr;

@end

