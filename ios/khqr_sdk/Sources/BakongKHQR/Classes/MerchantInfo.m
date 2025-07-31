//
//  MerchantInfo.m
//  BakongKHQR
//
//  Created by Seth Sambo on 7/6/21.
//

#import "MerchantInfo.h"
#import "Constants.h"

@interface MerchantInfo()

@end

@implementation MerchantInfo
@synthesize accountId;
@synthesize currencyType;
@synthesize amount;
@synthesize merchantCity;
@synthesize merchantName;
@synthesize billNumber;
@synthesize storeLabel;
@synthesize terminalLabel;
@synthesize mobileNumber;
@synthesize purposeOfTransaction;
@synthesize acquiringBank;
@synthesize accountInformation;
@synthesize merchantId;
@synthesize merchantAlternateLanguagePreference;
@synthesize merchantNameAlternateLanguage;
@synthesize merchantCityAlternateLanguage;
@synthesize merchantCategoryCode;
@synthesize upiAccountInformation;
@synthesize expirationTimestamp;

-(MerchantInfo * _Nullable)initWithAccountId  :(NSString * _Nonnull)accountId
                                    merchantId: (NSString * _Nonnull)merchantId
                                  merchantName:(NSString * _Nonnull)merchantName
                                 acquiringBank: (NSString * _Nonnull)acquiringBank
                                      currency: (CurrencyType)currencyType
                                        amount: (double) amount {
    self = [super init];
    if (self) {
        self.accountId = accountId;
        self.merchantId = merchantId;
        self.merchantName = merchantName;
        self.acquiringBank = acquiringBank;
        self.currencyType = currencyType;
        self.amount = amount;
    }
    return self;
}

-(MerchantInfo * _Nullable)initWithAccountId  :(NSString * _Nonnull)accountId
                                    merchantId: (NSString * _Nonnull)merchantId
                                  merchantName:(NSString * _Nonnull)merchantName
                                 acquiringBank: (NSString * _Nonnull)acquiringBank {
    return [self initWithAccountId: accountId
                        merchantId: merchantId
                      merchantName: merchantName
                     acquiringBank: acquiringBank
                          currency:[Constants defaultCurrency]
                            amount: 0];
}

@end
