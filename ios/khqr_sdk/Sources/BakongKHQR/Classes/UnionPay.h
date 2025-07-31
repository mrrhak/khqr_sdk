//
//  UnionPay.h
//  BakongKHQR
//
//  Created by Seth Sambo on 28/6/23.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"
#import "Enums.h"

@interface UnionPay : NSObject<TagLengthStringProtocol>

-(id)initWithUpiAccountInformation:(NSString *)upiAccountInformation currencyType: (CurrencyType)currencyType;
-(id)initWithUpiAccountInformation :(NSString *)upiAccountInformation;
-(NSString *) decodeWithQr: (NSString *)qr;

@end
