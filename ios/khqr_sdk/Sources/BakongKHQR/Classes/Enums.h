//
//  Enums.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/16/20.
//

typedef NS_ENUM(NSInteger, QRType) {
    Individual = 29, Merchant = 30
};

typedef NS_ENUM(NSInteger, CurrencyType){
    Khr = 116, Usd = 840
};


typedef NS_ENUM(NSInteger, KHQRExceptionReasons) {
    accountIdRequired, // 1
    merchantNameRequired, // 2
    accountIdInvalid, // 3
    tranAmountInvalid, // 4
    merchantTypeRequired, // 5
    accountIdLengthInvalid, // 6
    merchantNameLengthInvalid, //7
    qrInvalid, // 8
    currencyTypeRequired, // 9
    billNumberLengthInvalid, // 10
    storeLabelLengthInvalid, // 11
    terminalLabelLengthInvalid, // 12
    purposeOfTransactionLengthInvalid, // 43
    connectionTimeout, // 13
    deeplinkSourceInfoInvalid, // 14
    internalServerError, // 15
    
    
    formatIndicatorLengthInvalid, // 16
    pointOfInitializeLengthInvalid, // 17
    merchantCategoryCodeLengthInvalid, // 18
    transactionCurrencyLengthInvalid, // 19
    countryCodeLengthInvalid, // 20
    merchantCityLengthInvalid, // 21
    crcLengthInvalid, // 22
    formatIndicatorRequired, // 23
    crcRequired, // 24
    merchantCategoryCodeRequired, // 25
    countryCodeRequired, // 26
    merchantCityRequired, // 27
    unsupportedTransactionCurrency, // 28
    invalidDeepLinkURL, // 29
    
    merchantIdrequired, // 30
    acquiringBankRequired, // 31
    merchantIdLengthInvalid, // 32
    acquiringBankLengthInvalid, // 33
    mobileNumberLengthInvalid, // 34
    tagNotInOrder, // 35
    accountInfoLengthInvalid, // 36
    merchantLanguagePreferenceRequired, // 37
    merchantLanguagePreferenceLengthInvalid, // 38
    merchantNameAlternateLanguageRequired, // 39
    merchantNameAlternateLanguageLengthInvalid, // 40
    merchantCityAlternateLanguageLengthInvalid, // 41
    upiAccountInformationLengthInvalid, // 43
    upiAccountInformationNotSupportUSD, // 44
    expirationTimestampRequired, // 45
    khqrExpired, // 46
    invalidDynamicKhqr, // 47
    pointInitiationMethodInvalid, // 48
    expirationTimestampLengthInvalid, // 49
    expirationTimestampInThePast, // 50
    merchantCategoryCodeInvalidValue // 51
};
