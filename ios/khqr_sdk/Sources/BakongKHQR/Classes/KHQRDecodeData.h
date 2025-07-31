//
//  KHQRDecodeData.h
//  BakongKHQR
//
//  Created by Seth Sambo on 2/15/21.
//

#import <Foundation/Foundation.h>
#import "Enums.h"
#import "ResponseProtocol.h"
#import "TransactionCurrency.h"

@interface KHQRDecodeData : NSObject<ResponseProtocol>

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
         expirationTimestamp: (NSString *)expirationTimestamp
                         crc: (NSString *)crc;

-(void)printAll;

@property (strong, nonatomic) NSString * payloadFormatIndicator;
@property (strong, nonatomic) NSString * pointOfInitiationMethod;
@property (strong, nonatomic) NSString * merchantType;
@property (strong, nonatomic) NSString * upiAccountInformation;
@property (strong, nonatomic) NSString * bakongAccountID;
@property (strong, nonatomic) NSString * merchantAccountId;
@property (strong, nonatomic) NSString * accountInformation;
@property (strong, nonatomic) NSString * acquiringBank;
@property (strong, nonatomic) NSString * merchantCategoryCode;
@property (strong, nonatomic) NSString * countryCode;
@property (strong, nonatomic) NSString * merchantName;
@property (strong, nonatomic) NSString * merchantCity;
@property (strong, nonatomic) NSString * transactionCurrency;
@property (strong, nonatomic) NSString * transactionAmount;
@property (strong, nonatomic) NSString * billNumber;
@property (strong, nonatomic) NSString * mobileNumber;
@property (strong, nonatomic) NSString * storeLabel;
@property (strong, nonatomic) NSString * terminalLabel;
@property (strong, nonatomic) NSString * purposeOfTransaction;
@property (strong, nonatomic) NSString * merchantAlternateLanguagePreference;
@property (strong, nonatomic) NSString * merchantNameAlternateLanguage;
@property (strong, nonatomic) NSString * merchantCityAlternateLanguage;
@property (strong, nonatomic) NSString * timestamp;
@property (strong, nonatomic) NSString * expirationTimestamp;
@property (strong, nonatomic) NSString * crc;

@end
