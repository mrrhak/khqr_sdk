//
//  TransactionCurrency.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"
#import "Enums.h"

@interface TransactionCurrency : NSObject<TagLengthStringProtocol>

-(id)initWithCurrency :(CurrencyType)currency;
-(NSString *) decodeWithQr: (NSString *)qr;

@end

