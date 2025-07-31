//
//  MerchantCity.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface MerchantCity : NSObject<TagLengthStringProtocol>

-(id)initWithMerchantCity :(NSString *)city;
-(NSString *) decodeWithQr: (NSString *)qr;

@end

