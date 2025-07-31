//
//  MerchantAlternateLanguagePreference.h
//  BakongKHQR
//
//  Created by Seth Sambo on 27/6/23.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface MerchantLanguageAlternatePreference : NSObject<TagLengthStringProtocol>

-(id)initWithLanguagePreference :(NSString *)languagePreference;
-(NSString *) decodeWithQr: (NSString *)qr;

@end

