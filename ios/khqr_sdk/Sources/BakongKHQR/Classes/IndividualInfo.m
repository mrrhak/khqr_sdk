//
//  IndividualInfo.m
//  BakongKHQR
//
//  Created by Seth Sambo on 7/6/21.
//

#import "IndividualInfo.h"
#import "Constants.h"

@interface IndividualInfo()

@end

@implementation IndividualInfo
@synthesize accountId;
@synthesize currencyType;
@synthesize amount;
@synthesize merchantCity;
@synthesize merchantName;
@synthesize billNumber;
@synthesize storeLabel;
@synthesize terminalLabel;
@synthesize purposeOfTransaction; 
@synthesize mobileNumber;
@synthesize accountInformation;
@synthesize acquiringBank;
@synthesize merchantAlternateLanguagePreference;
@synthesize merchantNameAlternateLanguage;
@synthesize merchantCityAlternateLanguage;
@synthesize merchantCategoryCode;
@synthesize upiAccountInformation;
@synthesize expirationTimestamp;

#pragma mark - Init
-(IndividualInfo * _Nullable)initWithAccountId  :(NSString *)accountId
                                            merchantName:(NSString *)merchantName
                               accountInformation:(NSString *)accountInformation
                                   acquiringBank:(NSString *)acquiringBank
                                        currency: (CurrencyType) currencyType
                                          amount: (double) amount {
    self = [super init];
    if (self) {
        self.accountId = accountId;
        self.merchantName = merchantName;
        self.currencyType = currencyType;
        self.amount = amount;
        self.accountInformation = accountInformation;
        self.acquiringBank = acquiringBank;
    }
    return self;
}

-(IndividualInfo *)initWithAccountId  :(NSString *)accountId
                                            merchantName:(NSString *)merchantName {
    return [self initWithAccountId: accountId
               merchantName: merchantName
            accountInformation: NULL
                     acquiringBank: NULL
                   currency: [Constants defaultCurrency]
                     amount: 0];
}

-(IndividualInfo *)initWithAccountId  :(NSString *)accountId
                                    merchantName:(NSString *)merchantName
                              accountInformation:(NSString *)accountInformation
                                   acquiringBank:(NSString *)acquiringBank {
    return [self initWithAccountId: accountId
               merchantName: merchantName
            accountInformation: accountInformation
                     acquiringBank: acquiringBank
                   currency: [Constants defaultCurrency]
                     amount: 0];
}

-(IndividualInfo *)initWithAccountId  :(NSString *)accountId
                                    merchantName:(NSString *)merchantName
                                        currency: (CurrencyType) currencyType
                                          amount: (double) amount {
    return [self initWithAccountId: accountId
               merchantName: merchantName
            accountInformation: NULL
                     acquiringBank: NULL
                   currency: currencyType
                     amount: amount];
}

@end
