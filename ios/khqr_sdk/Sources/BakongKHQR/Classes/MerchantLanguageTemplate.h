//
//  MerchantLanguageTemplate.h
//  BakongKHQR
//
//  Created by Seth Sambo on 27/6/23.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"
#import "MerchantLanguageAlternatePreference.h"
#import "MerchantNameAlternateLanguage.h"
#import "MerchantCityAlternateLanguage.h"

@interface MerchantLanguageTemplate : NSObject<TagLengthStringProtocol>


-(id)initWithLanguagePreference :(NSString *)languagePreference merchantNameAlternateLanguage: (NSString *)merchantName merchantCityAlternateLanguage: (NSString *)merchantCity;
-(NSString *) decodeWithQr: (NSString *)qr;

-(void)setMerchantLanguageAlternatePreference: (NSString *)languagePreference;
-(void)setMerchantNameAlternateLanguage: (NSString *)merchantName;
-(void)setMerchantCityAlternateLanguage: (NSString *)merchantCity;

-(NSString *) getMerchantLanguageAlternatePreference;
-(NSString *) getMerchantNameAlternateLanguage;
-(NSString *) getMerchantCityAlternateLanguage;

@end
