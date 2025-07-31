//
//  AccountTypeProtocol.h
//  BakongKHQR
//
//  Created by Seth Sambo on 7/6/21.
//
#import <Foundation/Foundation.h>

@protocol AccountTypeProtocol <NSObject>

@required
@property (nonatomic, strong) NSString * _Nonnull accountId;
@property CurrencyType currencyType;
@property (nonatomic) double amount;
@property (strong, nonatomic) NSString * _Nullable merchantCity;
@property (strong, nonatomic) NSString * _Nullable merchantName;
@property (strong, nonatomic) NSString * _Nullable billNumber;
@property (strong, nonatomic) NSString * _Nullable storeLabel;
@property (strong, nonatomic) NSString * _Nullable terminalLabel;
@property (strong, nonatomic) NSString * _Nullable purposeOfTransaction;
@property (strong, nonatomic) NSString * _Nullable mobileNumber;
@property (strong, nonatomic) NSString * _Nullable accountInformation;
@property (strong, nonatomic) NSString * _Nullable merchantId;
@property (strong, nonatomic) NSString * _Nullable acquiringBank;
@property (strong, nonatomic) NSString * _Nullable merchantAlternateLanguagePreference;
@property (strong, nonatomic) NSString * _Nullable merchantNameAlternateLanguage;
@property (strong, nonatomic) NSString * _Nullable merchantCityAlternateLanguage;
@property (strong, nonatomic) NSString * _Nullable merchantCategoryCode;
@property (strong, nonatomic) NSString * _Nullable upiAccountInformation;
@property (nonatomic, strong, nullable) NSNumber *expirationTimestamp;

@end

