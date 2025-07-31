//
//  MerchantInfo.h
//  BakongKHQR
//
//  Created by Seth Sambo on 7/6/21.
//

#import <Foundation/Foundation.h>
#import "Enums.h"
#import "AccountTypeProtocol.h"

@interface MerchantInfo : NSObject <AccountTypeProtocol>

-(MerchantInfo * _Nullable)initWithAccountId  :(NSString * _Nonnull)accountId
                                    merchantId: (NSString * _Nonnull)merchantId
                                  merchantName:(NSString * _Nonnull)merchantName
                                 acquiringBank: (NSString * _Nonnull)acquiringBank
                                      currency: (CurrencyType)currencyType
                                        amount: (double) amount;

-(MerchantInfo * _Nullable)initWithAccountId  :(NSString * _Nonnull)accountId
                                    merchantId: (NSString * _Nonnull)merchantId
                                  merchantName:(NSString * _Nonnull)merchantName
                                 acquiringBank: (NSString * _Nonnull)acquiringBank;

@end


