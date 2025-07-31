//
//  MerchantNameAlternateLanguage.h
//  BakongKHQR
//
//  Created by Seth Sambo on 27/6/23.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface MerchantNameAlternateLanguage : NSObject<TagLengthStringProtocol>

-(id)initWithAlternateName :(NSString *)alternateName;
-(NSString *) decodeWithQr: (NSString *)qr;

@end
