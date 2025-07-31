//
//  MerchantCategoryCode.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface MerchantCategoryCode : NSObject<TagLengthStringProtocol>

-(id)initWithCode :(NSString *)categoryCode;
-(NSString *) decodeWithQr: (NSString *)qr;

@end

