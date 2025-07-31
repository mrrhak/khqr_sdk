//
//  CountryCode.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface CountryCode : NSObject<TagLengthStringProtocol>

-(id)initWithCountryCode :(NSString *)countryCode;
-(NSString *) decodeWithQr: (NSString *)qr;

@end

