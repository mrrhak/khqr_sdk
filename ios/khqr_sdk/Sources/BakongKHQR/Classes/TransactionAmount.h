//
//  TransactionAmount.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"
#import "Enums.h"

@interface TransactionAmount : NSObject<TagLengthStringProtocol>

-(id)initWithAmount :(double)amount currencyType: (CurrencyType)currencyType;
-(NSString *) decodeWithQr: (NSString *)qr;

@end

