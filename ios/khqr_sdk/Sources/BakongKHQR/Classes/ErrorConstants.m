//
//  ErrorConstants.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/22/20.
//

#import "ErrorConstants.h"

static short ACCOUNT_ID_REQUIRED_CODE = 1;
static NSString * ACCOUNT_ID_REQUIRED_MESSAGE = @"Bakong Account ID cannot be null or empty";


static short MERCHANT_NAME_REQUIRED_CODE = 2;
static NSString * MERCHANT_NAME__REQUIRED_MESSAGE = @"Merchant name cannot be null or empty";

static short ACCOUNT_ID_INVALID_CODE = 3;
static NSString * ACCOUNT_ID_INVALID_MESSAGE = @"Bakong Account ID is invalid";

static short TRAN_AMOUNT_INVALID_CODE = 4;
static NSString * TRAN_AMOUNT_INVALID_MESSAGE = @"Amount is invalid";

static short MERCHANT_TYPE_REQUIRED_CODE = 5;
static NSString * MERCHANT_TYPE_REQUIRED_MESSAGE = @"Merchant type cannot be null or empty";

static short ACCOUNT_ID_LENGTH_INVALID_CODE = 6;
static NSString * ACCOUNT_ID_LENGTH_INVALID_MESSAGE = @"Bakong Account ID length is invalid";

static short MERCHANT_NAME_LENGTH_INVALID_CODE = 7;
static NSString * MERCHANT_NAME_LENGTH_INVALID_MESSAGE = @"Merchant name length is invalid";

static short QR_INVALID_CODE = 8;
static NSString * QR_INVALID_MESSAGE = @"KHQR provided is invalid";

static short CURRENCY_TYPE_REQUIRED_CODE = 9;
static NSString * CURRENCY_TYPE_REQUIRED_MESSAGE = @"Currency type cannot be null or empty";

static short BILL_NUMBER_LENGTH_INVALID_CODE = 10;
static NSString * BILL_NUMBER_LENGTH_INVALID_MESSAGE = @"Bill number length is invalid";

static short STORE_LABEL_LENGTH_INVALID_CODE = 11;
static NSString * STORE_LABEL_LENGTH_INVALID_MESSAGE = @"Store label length is invalid";

static short TERMINAL_LABEL_LENGTH_INVALID_CODE = 12;
static NSString * TERMINAL_LABEL_LENGTH_INVALID_MESSAGE = @"Terminal label length is invalid";

static short PURPOSE_OF_TRANSACTION_LENGTH_INVALID_CODE = 42;
static NSString * PURPOSE_OF_TRANSACTION_LENGTH_INVALID_MESSAGE = @"Purpose of transaction length is invalid";

static short CONNECTION_TIMEOUT_ERROR_CODE = 13;
static NSString * CONNECTION_TIMEOUT_ERROR_MESSAGE = @"Connection time out";

static short INVALID_DEEP_SOURCE_INFO_ERROR_CODE = 14;
static NSString * INVALID_DEEP_SOURCE_INFO_ERROR_MESSAGE = @"Invalid deep link source info";

static short INTERNAL_SERVER_ERROR_CODE = 15;
static NSString * INTERNAL_SERVER_ERROR_MESSAGE = @"Internal server error";

static short FORMAT_INDICATOR_LENGTH_INVALID_CODE = 16;
static NSString * FORMAT_INDICATOR_LENGTH_INVALID_MESSAGE = @"Payload Format Indicator Length is invalid";

static short POINT_OF_INITIALIZE_INVALID_CODE = 17;
static NSString * POINT_OF_INITIALIZE_INVALID_MESSAGE = @"Point of Initiation Length is invalid";

static short MERCHANT_CATEGORY_CODE_LENGTH_INVALID_CODE = 18;
static NSString * MERCHANT_CATEGORY_CODE_LENGTH_INVALID_MESSAGE = @"Merchant Category Length is invalid";

static short TRANSACTION_CURRENCY_LENGTH_INVALID_CODE = 19;
static NSString * TRANSACTION_CURRENCY_LENGTH_INVALID_MESSAGE = @"Transaction Currency Length is invalid";

static short COUNTRY_CODE_LENGTH_INVALID_CODE = 20;
static NSString * COUNTRY_CODE_LENGTH_INVALID_MESSAGE = @"Country Code Length is invalid";

static short MERCHANT_CITY_LENGTH_INVALID_CODE = 21;
static NSString * MERCHANT_CITY_LENGTH_INVALID_MESSAGE = @"Merchant City Length is invalid";

static short CRC_LENGTH_INVALID_CODE = 22;
static NSString * CRC_LENGTH_INVALID_MESSAGE = @"CRC Length is invalid";

static short FORMAT_INDICATOR_REQUIRED_CODE = 23;
static NSString * FORMAT_INDICATOR_REQUIRED_MESSAGE = @"Payload Format Indicator cannot be null or empty";

static short CRC_REQUIRED_CODE = 24;
static NSString * CRC_REQUIRED_MESSAGE = @"CRC cannot be null or empty";

static short MERCHANT_CATEGORY_CODE_REQUIRED_CODE = 25;
static NSString * MERCHANT_CATEGORY_CODE_REQUIRED_MESSAGE = @"Merchant Category cannot be null or empty";

static short COUNTRY_CODE_REQUIRED_CODE = 26;
static NSString * COUNTRY_CODE_REQUIRED_MESSAGE = @"Country Code cannot be null or empty";

static short MERCHANT_CITY_REQUIRED_CODE = 27;
static NSString * MERCHANT_CITY_REQUIRED_MESSAGE = @"Merchant City cannot be null or empty";

static short UNSUPPORTED_TRANSACTION_CURRENCY_CODE = 28;
static NSString * UNSUPPORTED_TRANSACTION_CURRENCY_MESSAGE = @"Unsupported currency";

static short INVALID_DEEP_LINK_URL_CODE = 29;
static NSString * INVALID_DEEP_LINK_URL_MESSAGE = @"Invalid deeplink URL";

static short MERCHANT_ID_REQUIRED_CODE = 30;
static NSString * MERCHANT_ID_REQUIRED_MESSAGE = @"Merchant ID cannot be null or empty";

static short ACQUIRING_BANK_REQUIRED_CODE = 31;
static NSString * ACQUIRING_BANK_REQUIRED_MESSAGE = @"Acquiring bank cannot be null or empty";

static short MERCHANT_ID_LENGTH_INVALID_CODE = 32;
static NSString * MERCHANT_ID_LENGTH_INVALID_MESSAGE = @"Merchant ID length is invalid";

static short ACQUIRING_BANK_LENGTH_INVALID_CODE = 33;
static NSString * ACQUIRING_BANK_LENGTH_INVALID_MESSAGE = @"Acquiring bank length is invalid";

static short MOBILE_NUMBER_LENGTH_INVALID_CODE = 34;
static NSString * MOBILE_NUMBER_LENGTH_INVALID_MESSAGE = @"Mobile number length is invalid";

static short TAG_NOT_IN_ORDER_CODE = 35;
static NSString * TAG_NOT_IN_ORDER_MESSAGE = @"Tag is not in order";

static short ACCOUNT_INFO_LENGTH_INVALID_CODE = 36;
static NSString * ACCOUNT_INFO_LENGTH_INVALID_MESSAGE = @"Account information length is invalid";

static short MERCHANT_LANGUAGE_PREFERENCE_REQUIRED_CODE = 37;
static NSString * MERCHANT_LANGUAGE_PREFERENCE_REQUIRED_MESSAGE = @"Merchant alternate language preference cannot be null or empty";


static short MERCHANT_LANGUAGE_PREFERENCE_LENGTH_INVALID_CODE = 38;
static NSString * MERCHANT_LANGUAGE_PREFERENCE_LENGTH_INVALID_MESSAGE = @"Merchant alternate language preference length is invalid";

static short MERCHANT_NAME_ALTERNATE_LANGUAGE_REQUIRED_CODE = 39;
static NSString * MERCHANT_NAME_ALTERNATE_LANGUAGE_REQUIRED_MESSAGE = @"Merchant name alternate language cannot be null or empty";

static short MERCHANT_NAME_ALTERNATE_LANGUAGE_LENGTH_INVALID_CODE = 40;
static NSString * MERCHANT_NAME_ALTERNATE_LANGUAGE_LENGTH_INVALID_MESSAGE = @"Merchant name alternate language length is invalid";

static short MERCHANT_CITY_ALTERNATE_LANGUAGE_LENGTH_INVALID_CODE = 41;
static NSString * MERCHANT_CITY_ALTERNATE_LANGUAGE_LENGTH_INVALID_MESSAGE = @"Merchant city alternate language length is invalid";


static short UPI_ACCOUNT_INFORMATION_LENGTH_INVALID_CODE = 43;
static NSString * UPI_ACCOUNT_INFORMATION_LENGTH_INVALID_MESSAGE = @"Upi account information length is invalid";

static short UPI_ACCOUNT_INFORMATION_NOT_SUPPORT_USD_CODE = 44;
static NSString * UPI_ACCOUNT_INFORMATION_NOT_SUPPORT_USD_MESSAGE = @"KHQR does not support UPI Account Information with USD currency";

static short EXPIRATION_TIMESTAMP_REQUIRED = 45;
static NSString * EXPIRATION_TIMESTAMP_REQUIRED_MESSAGE = @"Expiration Timestamp cannot be null or empty";

static short KHQR_EXPIRED = 46;
static NSString * KHQR_EXPIRED_MESSAGE = @"This dynamic KHQR has expired";

static short INVALID_DYNAMIC_KHQR = 47;
static NSString * INVALID_DYNAMIC_KHQR_MESSAGE = @"This dynamic KHQR has invalid field transaction amount or expiration timestamp";

static short POINT_OF_INITIATION_METHOD_INVALID = 48;
static NSString * POINT_OF_INITIATION_METHOD_INVALID_MESSAGE = @"Point of Initiation Method is invalid";

static short EXPIRATION_TIMESTAMP_LENGTH_INVALID = 49;
static NSString * EXPIRATION_TIMESTAMP_LENGTH_INVALID_MESSAGE = @"Expiration timestamp length is invalid";

static short EXPIRATION_TIMESTAMP_IN_THE_PAST_CODE = 50;
static NSString * EXPIRATION_TIMESTAMP_IN_THE_PAST_MESSAGE = @"Expiration timestamp is in the past";

static short INVALID_MERCHANT_CATEGORY_CODE = 51;
static NSString * INVALID_MERCHANT_CATEGORY_MESSAGE = @"Invalid merchant category code";

@implementation ErrorConstants

+(NSNumber *) invalidMerchantCategoryCode {
    return [NSNumber numberWithInt: INVALID_MERCHANT_CATEGORY_CODE] ;
}

+(NSString *) invalidMerchantCategoryMessage {
    return INVALID_MERCHANT_CATEGORY_MESSAGE;
}

+(NSNumber *) accountIdRequiredCode{
    return [NSNumber numberWithInt: ACCOUNT_ID_REQUIRED_CODE] ;
}
+(NSString *) accountIdRequiredMessage{
    return ACCOUNT_ID_REQUIRED_MESSAGE;
}


+(NSNumber *) merchantNameRequiredCode{
    return [NSNumber numberWithInt: MERCHANT_NAME_REQUIRED_CODE] ;
}
+(NSString *) merchantNameRequiredMessage{
    return MERCHANT_NAME__REQUIRED_MESSAGE;
}


+(NSNumber *) accountIdInvalidCode{
    return [NSNumber numberWithInt: ACCOUNT_ID_INVALID_CODE] ;
}
+(NSString *) accountIdInvalidMessage{
    return ACCOUNT_ID_INVALID_MESSAGE;
}

+(NSNumber *) tranAmountInvalidCode{
    return [NSNumber numberWithInt: TRAN_AMOUNT_INVALID_CODE] ;
}
+(NSString *) tranAmountInvalidMessage{
    return TRAN_AMOUNT_INVALID_MESSAGE;
}

+(NSNumber *) merchantTypeRequiredCode{
    return [NSNumber numberWithInt: MERCHANT_TYPE_REQUIRED_CODE] ;
}
+(NSString *) merchantTypeRequiredMessage{
    return MERCHANT_TYPE_REQUIRED_MESSAGE;
}


+(NSNumber *) accountIdLengthInvalidCode{
    return [NSNumber numberWithInt: ACCOUNT_ID_LENGTH_INVALID_CODE] ;
}
+(NSString *) accountIdLengthInvalidMessage{
    return ACCOUNT_ID_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) merchantNameLengthInvalidCode{
    return [NSNumber numberWithInt: MERCHANT_NAME_LENGTH_INVALID_CODE] ;
}
+(NSString *) merchantNameLengthInvalidMessage{
    return MERCHANT_NAME_LENGTH_INVALID_MESSAGE;
}


+(NSNumber *) qrInvalidCode{
    return [NSNumber numberWithInt: QR_INVALID_CODE] ;
}
+(NSString *) qrInvalidMessage{
    return QR_INVALID_MESSAGE;
}

+(NSNumber *) currencyTypeRequiredCode{
    return [NSNumber numberWithInt: CURRENCY_TYPE_REQUIRED_CODE] ;
}
+(NSString *) currencyTypeRequiredMessage{
    return CURRENCY_TYPE_REQUIRED_MESSAGE;
}

+(NSNumber *) billNumberLengthInvalidCode {
    return [NSNumber numberWithInt: BILL_NUMBER_LENGTH_INVALID_CODE];
}
+(NSString *) billNumberLengthInvalidMessage {
    return BILL_NUMBER_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) storeLabelLengthInvalidCode {
    return  [NSNumber numberWithInt: STORE_LABEL_LENGTH_INVALID_CODE];
}
+(NSString *) storeLabelLengthInvalidMessage {
    return STORE_LABEL_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) terminalLabelLengthInvalidCode {
    return [NSNumber numberWithInt: TERMINAL_LABEL_LENGTH_INVALID_CODE];
}
+(NSString *) terminalLabelLengthInvalidMessage {
    return TERMINAL_LABEL_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) purposeOfTransactionLengthInvalidCode {
    return [NSNumber numberWithInt: PURPOSE_OF_TRANSACTION_LENGTH_INVALID_CODE];
}
+(NSString *) purposeOfTransactionLengthInvalidMessage {
    return PURPOSE_OF_TRANSACTION_LENGTH_INVALID_MESSAGE;
}


+(NSNumber *) connectionTimeoutErrorCode {
    return [NSNumber numberWithInt: CONNECTION_TIMEOUT_ERROR_CODE];
}
+(NSString *) connectionTimeoutErrorMessage {
    return CONNECTION_TIMEOUT_ERROR_MESSAGE;
}

+(NSNumber *) invalidDeepSourceInfoErrorCode {
    return [NSNumber numberWithInt: INVALID_DEEP_SOURCE_INFO_ERROR_CODE];
}
+(NSString *) invalidDeepSourceInfoErrorMessage {
    return INVALID_DEEP_SOURCE_INFO_ERROR_MESSAGE;
}

+(NSNumber *) internalServerErrorCode {
    return [NSNumber numberWithInt: INTERNAL_SERVER_ERROR_CODE];
}
+(NSString *) internalServerErrorMessage {
    return INTERNAL_SERVER_ERROR_MESSAGE;
}

+(NSNumber *) formatIndicatorLengthInvalidCode {
    return [NSNumber numberWithInt: FORMAT_INDICATOR_LENGTH_INVALID_CODE];
}
+(NSString *) formatIndicatorLengthInvalidMessage {
    return FORMAT_INDICATOR_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) pointOfInitializeLengthInvalidCode {
    return [NSNumber numberWithInt: POINT_OF_INITIALIZE_INVALID_CODE];
}
+(NSString *) pointOfInitializeLengthInvalidMessage {
    return POINT_OF_INITIALIZE_INVALID_MESSAGE;
}

+(NSNumber *) merchantCategoryCodeLengthInvalidCode {
    return [NSNumber numberWithInt: MERCHANT_CATEGORY_CODE_LENGTH_INVALID_CODE];
}
+(NSString *) merchantCategoryCodeLengthInvalidMessage {
    return MERCHANT_CATEGORY_CODE_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) transactionCurrencyLengthInvalidCode {
    return [NSNumber numberWithInt: TRANSACTION_CURRENCY_LENGTH_INVALID_CODE];
}
+(NSString *) transactionCurrencyLengthInvalidMessage {
    return TRANSACTION_CURRENCY_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) countryCodeLengthInvalidCode {
    return [NSNumber numberWithInt: COUNTRY_CODE_LENGTH_INVALID_CODE];
}
+(NSString *) countryCodeLengthInvalidMessage {
    return COUNTRY_CODE_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) merchantCityLengthInvalidCode {
    return [NSNumber numberWithInt: MERCHANT_CITY_LENGTH_INVALID_CODE];
}
+(NSString *) merchantCityLengthInvalidMessage {
    return MERCHANT_CITY_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) crcLengthInvalidCode {
    return [NSNumber numberWithInt: CRC_LENGTH_INVALID_CODE];
}
+(NSString *) crcLengthInvalidMessage {
    return CRC_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) formatIndicatorRequiredCode {
    return [NSNumber numberWithInt: FORMAT_INDICATOR_REQUIRED_CODE];
}
+(NSString *) formatIndicatorRequiredMessage {
    return FORMAT_INDICATOR_REQUIRED_MESSAGE;
}

+(NSNumber *) crcRequiredCode {
    return [NSNumber numberWithInt: CRC_REQUIRED_CODE];
}
+(NSString *) crcRequiredMessage {
    return CRC_REQUIRED_MESSAGE;
}

+(NSNumber *) merchantCategoryCodeRequiredCode {
    return [NSNumber numberWithInt: MERCHANT_CATEGORY_CODE_REQUIRED_CODE];
}
+(NSString *) merchantCategoryCodeRequiredMessage {
    return MERCHANT_CATEGORY_CODE_REQUIRED_MESSAGE;
}

+(NSNumber *) countryCodeRequiredCode {
    return [NSNumber numberWithInt: COUNTRY_CODE_REQUIRED_CODE];
}
+(NSString *) countryCodeRequiredMessage {
    return COUNTRY_CODE_REQUIRED_MESSAGE;
}

+(NSNumber *) merchantCityRequiredCode {
    return [NSNumber numberWithInt: MERCHANT_CITY_REQUIRED_CODE];
}
+(NSString *) merchantCityRequiredMessage {
    return MERCHANT_CITY_REQUIRED_MESSAGE;
}

+(NSNumber *) upiAccountInformationLengthInvalidCode {
    return [NSNumber numberWithInt: UPI_ACCOUNT_INFORMATION_LENGTH_INVALID_CODE];
}
+(NSString *) upiAccountInformationLengthInvalidMessage {
    return UPI_ACCOUNT_INFORMATION_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) unsupportedTransactionCurrencyCode {
    return [NSNumber numberWithInt: UNSUPPORTED_TRANSACTION_CURRENCY_CODE];
}
+(NSString *) unsupportedTransactionCurrencyMessage {
    return UNSUPPORTED_TRANSACTION_CURRENCY_MESSAGE;
}

+(NSNumber *) invalidDeepLinkURLCode {
    return [NSNumber numberWithInt: INVALID_DEEP_LINK_URL_CODE];
}
+(NSString *) invalidDeepLinkURLMessage {
    return INVALID_DEEP_LINK_URL_MESSAGE;
}


+(NSNumber *) merchantIdRequiredCode {
    return [NSNumber numberWithInt: MERCHANT_ID_REQUIRED_CODE];
}
+(NSString *) merchantIdRequiredMessage {
    return MERCHANT_ID_REQUIRED_MESSAGE;
}

+(NSNumber *) acquiringBankRequiredCode {
    return [NSNumber numberWithInt: ACQUIRING_BANK_REQUIRED_CODE];
}
+(NSString *) acquiringBankRequiredMessage {
    return ACQUIRING_BANK_REQUIRED_MESSAGE;
}

+(NSNumber *) merchantIdLengthInvalidCode {
    return [NSNumber numberWithInt: MERCHANT_ID_LENGTH_INVALID_CODE];
}
+(NSString *) merchantIdLengthInvalidMessage {
    return MERCHANT_ID_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) acquiringBankLengthInvalidCode {
    return [NSNumber numberWithInt: ACQUIRING_BANK_LENGTH_INVALID_CODE];
}
+(NSString *) acquiringBankLengthInvalidMessage {
    return ACQUIRING_BANK_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) mobileNumberLengthInvalidCode {
    return [NSNumber numberWithInt: MOBILE_NUMBER_LENGTH_INVALID_CODE];
}
+(NSString *) mobileNumberLengthInvalidMessage {
    return MOBILE_NUMBER_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) tagNotInOrderCode {
    return [NSNumber numberWithInt: TAG_NOT_IN_ORDER_CODE];
}
+(NSString *) tagNotInOrderMessage {
    return TAG_NOT_IN_ORDER_MESSAGE;
}

+(NSNumber *) accountInfoLengthInvalidCode {
    return [NSNumber numberWithInt: ACCOUNT_INFO_LENGTH_INVALID_CODE];
}
+(NSString *) accountInfoLengthInvalidMessage {
    return ACCOUNT_INFO_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) merchantLanguagePreferenceRequiredCode {
    return [NSNumber numberWithInt: MERCHANT_LANGUAGE_PREFERENCE_REQUIRED_CODE];
}
+(NSString *) merchantLanguagePreferenceRequiredMessage {
    return MERCHANT_LANGUAGE_PREFERENCE_REQUIRED_MESSAGE;
}

+(NSNumber *) merchantLanguagePreferenceLengthInvalidCode {
    return [NSNumber numberWithInt: MERCHANT_LANGUAGE_PREFERENCE_LENGTH_INVALID_CODE];
}
+(NSString *) merchantLanguagePreferenceLengthInvalidMessage {
    return MERCHANT_LANGUAGE_PREFERENCE_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) merchantNameAlternateLanguageRequiredCode {
    return [NSNumber numberWithInt: MERCHANT_NAME_ALTERNATE_LANGUAGE_REQUIRED_CODE];
}
+(NSString *) merchantNameAlternateLanguageRequiredMessage {
    return MERCHANT_NAME_ALTERNATE_LANGUAGE_REQUIRED_MESSAGE;
}

+(NSNumber *) merchantNameAlternateLanguageLengthInvalidCode {
    return [NSNumber numberWithInt: MERCHANT_NAME_ALTERNATE_LANGUAGE_LENGTH_INVALID_CODE];
}
+(NSString *) merchantNameAlternateLanguageLengthInvalidMessage {
    return MERCHANT_NAME_ALTERNATE_LANGUAGE_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) merchantCityAlternateLanguageLengthInvalidCode {
    return [NSNumber numberWithInt: MERCHANT_CITY_ALTERNATE_LANGUAGE_LENGTH_INVALID_CODE];
}
+(NSString *) merchantCityAlternateLanguageLengthInvalidMessage {
    return MERCHANT_CITY_ALTERNATE_LANGUAGE_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) upiAccountInformationNotSupportUSDCode {
    return [NSNumber numberWithInt: UPI_ACCOUNT_INFORMATION_NOT_SUPPORT_USD_CODE];
}

+(NSString *) upiAccountInformationNotSupportUSDMessage {
    return UPI_ACCOUNT_INFORMATION_NOT_SUPPORT_USD_MESSAGE;
}

+(NSNumber *) expirationTimestampRequiredCode {
    return [NSNumber numberWithInt: EXPIRATION_TIMESTAMP_REQUIRED];
}

+(NSString *) expirationTimestampRequiredMessage {
    return EXPIRATION_TIMESTAMP_REQUIRED_MESSAGE;
}

+ (NSNumber *)khqrExpiredCode {
    return [NSNumber numberWithInt: KHQR_EXPIRED];
}

+ (NSString *)khqrExpiredMessage {
    return KHQR_EXPIRED_MESSAGE;
}

+ (NSNumber *)dynamicKhqrInvalidCode {
    return [NSNumber numberWithInt: INVALID_DYNAMIC_KHQR];
}

+ (NSString *)dynamicKhqrInvalidMessage {
    return INVALID_DYNAMIC_KHQR_MESSAGE;
}

+ (NSNumber *)pointInitiationMethodInvalidCode {
    return [NSNumber numberWithInt: POINT_OF_INITIATION_METHOD_INVALID];
}

+ (NSString *)pointInitiationMethodInvalidMessage {
    return POINT_OF_INITIATION_METHOD_INVALID_MESSAGE;
}

+(NSNumber *) expirationTimestampLengthInvalidCode {
    return [NSNumber numberWithInt: EXPIRATION_TIMESTAMP_LENGTH_INVALID];
}

+(NSString *) expirationTimestampLengthInvalidMessage {
    return EXPIRATION_TIMESTAMP_LENGTH_INVALID_MESSAGE;
}

+(NSNumber *) expirationTimestampInThePastCode {
    return [NSNumber numberWithInt: EXPIRATION_TIMESTAMP_IN_THE_PAST_CODE];
}

+(NSString *) expirationTimestampInThePastMessage {
    return EXPIRATION_TIMESTAMP_IN_THE_PAST_MESSAGE;
}

@end
