//
//  MerchantCityAlternateLanguage.h
//  BakongKHQR
//
//  Created by Seth Sambo on 27/6/23.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface MerchantCityAlternateLanguage : NSObject<TagLengthStringProtocol>

-(id)initWithAlternateCity :(NSString *)alternateCity;
-(NSString *) decodeWithQr: (NSString *)qr;

@end
