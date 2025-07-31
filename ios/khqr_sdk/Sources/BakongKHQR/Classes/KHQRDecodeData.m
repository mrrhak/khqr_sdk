//
//  KHQRDecodeData.m
//  BakongKHQR
//
//  Created by Seth Sambo on 2/15/21.
//

#import "KHQRDecodeData.h"

@interface KHQRDecodeData()

@end

@implementation KHQRDecodeData

#define LogVariable(x) NSLog(@"%s = %@",#x, x)
@synthesize payloadFormatIndicator;
@synthesize pointOfInitiationMethod;
@synthesize upiAccountInformation;
@synthesize merchantType;
@synthesize bakongAccountID;
@synthesize merchantAccountId;
@synthesize accountInformation;
@synthesize acquiringBank;
@synthesize merchantCategoryCode;
@synthesize countryCode;
@synthesize merchantName;
@synthesize merchantCity;
@synthesize transactionCurrency;
@synthesize transactionAmount;
@synthesize billNumber;
@synthesize mobileNumber;
@synthesize storeLabel;
@synthesize terminalLabel;
@synthesize purposeOfTransaction;
@synthesize merchantAlternateLanguagePreference;
@synthesize merchantNameAlternateLanguage;
@synthesize merchantCityAlternateLanguage;
@synthesize timestamp;
@synthesize expirationTimestamp;
@synthesize crc;

-(id)initWithFormatIndicator: (NSString *)formatIndicator
           pointOfInitiation: (NSString *)pointOfInitiation
                      qrType: (NSString *)merchantType
       upiAccountInformation: (NSString *)upiAccountInformation
             bakongAccountId: (NSString *)accountId
           merchantAccountId: (NSString *)merchantAccountId
           accountInformation: (NSString *)accountInfo
               acquiringBank: (NSString *)acquiringBank
        merchantCategoryCode: (NSString *)merchantCategoryCode
                 countryCode: (NSString *)countryCode
                merchantName: (NSString *)merchantName
                merchantCity: (NSString *)merchantCity
         transactionCurrency: (NSString *)transactionCurrency
            transactionAmout: (NSString *)transactionAmount
                  billNumber: (NSString *)billNumber
                mobileNumber: (NSString *)mobileNumber
                  storeLabel: (NSString *)storeLabel
               terminalLabel: (NSString *)terminalLabel
        purposeOfTransaction: (NSString *)purposeOfTransaction
merchantAlternateLanguagePreference: (NSString *)languagePreference
merchantNameAlternateLanguage: (NSString *)merchantNameAlternateLanguage
merchantCityAlternateLanguage: (NSString *)merchantCityAlternateLanguage
                   timestamp: (NSString *)timestamp
         expirationTimestamp:(NSString *)expirationTimestamp
                         crc: (NSString *)crc {
    
    self = [super init];
    if (self) {
        self.payloadFormatIndicator = formatIndicator;
        self.pointOfInitiationMethod = pointOfInitiation;
        self.merchantType = merchantType;
        self.upiAccountInformation = upiAccountInformation;
        self.bakongAccountID = accountId;
        self.merchantAccountId = merchantAccountId;
        self.accountInformation = accountInfo;
        self.acquiringBank = acquiringBank;
        self.merchantCategoryCode = merchantCategoryCode;
        self.countryCode = countryCode;
        self.merchantName = merchantName;
        self.merchantCity = merchantCity;
        self.transactionCurrency = transactionCurrency;
        self.transactionAmount = transactionAmount;
        self.billNumber = billNumber;
        self.mobileNumber = mobileNumber;
        self.storeLabel = storeLabel;
        self.terminalLabel = terminalLabel;
        self.purposeOfTransaction = purposeOfTransaction;
        self.merchantAlternateLanguagePreference = languagePreference;
        self.merchantNameAlternateLanguage = merchantNameAlternateLanguage;
        self.merchantCityAlternateLanguage = merchantCityAlternateLanguage;
        self.timestamp = timestamp;
        self.expirationTimestamp = expirationTimestamp;
        self.crc = crc;
        
    }
    return self;
    
}

-(void)printAll {
    LogVariable(payloadFormatIndicator);
    LogVariable(pointOfInitiationMethod);
    LogVariable(merchantType);
    LogVariable(upiAccountInformation);
    LogVariable(bakongAccountID);
    LogVariable(merchantAccountId);
    LogVariable(accountInformation);
    LogVariable(acquiringBank);
    LogVariable(merchantCategoryCode);
    LogVariable(countryCode);
    LogVariable(merchantName);
    LogVariable(merchantCity);
    LogVariable(transactionCurrency);
    LogVariable(transactionAmount);
    LogVariable(billNumber);
    LogVariable(mobileNumber);
    LogVariable(storeLabel);
    LogVariable(terminalLabel);
    LogVariable(purposeOfTransaction);
    LogVariable(merchantAlternateLanguagePreference);
    LogVariable(merchantNameAlternateLanguage);
    LogVariable(merchantCityAlternateLanguage);
    LogVariable(timestamp);
    LogVariable(expirationTimestamp);
    LogVariable(crc);
}

@end
