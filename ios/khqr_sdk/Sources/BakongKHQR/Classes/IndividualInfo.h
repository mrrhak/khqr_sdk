//
//  IndividualInfo.h
//  BakongKHQR
//
//  Created by Seth Sambo on 7/6/21.
//

#import <Foundation/Foundation.h>
#import "Enums.h"
#import "AccountTypeProtocol.h"

@interface IndividualInfo : NSObject<AccountTypeProtocol>

-(IndividualInfo * _Nullable)initWithAccountId  :(NSString * _Nonnull)accountId
                                            merchantName:(NSString * _Nonnull)merchantName
                               accountInformation:(NSString * _Nullable)accountInformation
                                   acquiringBank:(NSString * _Nullable)acquiringBank
                                        currency: (CurrencyType) currencyType
                                          amount: (double) amount;

-(IndividualInfo * _Nullable)initWithAccountId  :(NSString * _Nonnull)accountId
                                            merchantName:(NSString * _Nonnull)merchantName;

-(IndividualInfo * _Nullable)initWithAccountId  :(NSString * _Nonnull)accountId
                                    merchantName:(NSString * _Nonnull)merchantName
                              accountInformation:(NSString * _Nullable)accountInformation
                                   acquiringBank:(NSString * _Nullable)acquiringBank;

-(IndividualInfo * _Nullable)initWithAccountId  :(NSString * _Nonnull)accountId
                                    merchantName:(NSString * _Nonnull)merchantName
                                        currency: (CurrencyType) currencyType
                                          amount: (double) amount;
@end
