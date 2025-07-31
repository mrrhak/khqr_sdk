//
//  ErrorConstants.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/22/20.
//

#import <Foundation/Foundation.h>

@interface ErrorConstants : NSObject

+(NSNumber *) accountIdRequiredCode;
+(NSString *) accountIdRequiredMessage;

+(NSNumber *) merchantNameRequiredCode;
+(NSString *) merchantNameRequiredMessage;

+(NSNumber *) accountIdInvalidCode;
+(NSString *) accountIdInvalidMessage;

+(NSNumber *) tranAmountInvalidCode;
+(NSString *) tranAmountInvalidMessage;

+(NSNumber *) merchantTypeRequiredCode;
+(NSString *) merchantTypeRequiredMessage;

+(NSNumber *) accountIdLengthInvalidCode;
+(NSString *) accountIdLengthInvalidMessage;

+(NSNumber *) merchantNameLengthInvalidCode;
+(NSString *) merchantNameLengthInvalidMessage;

+(NSNumber *) qrInvalidCode;
+(NSString *) qrInvalidMessage;

+(NSNumber *) currencyTypeRequiredCode;
+(NSString *) currencyTypeRequiredMessage;

+(NSNumber *) billNumberLengthInvalidCode;
+(NSString *) billNumberLengthInvalidMessage;

+(NSNumber *) storeLabelLengthInvalidCode;
+(NSString *) storeLabelLengthInvalidMessage;

+(NSNumber *) terminalLabelLengthInvalidCode;
+(NSString *) terminalLabelLengthInvalidMessage;

+(NSNumber *) purposeOfTransactionLengthInvalidCode;
+(NSString *) purposeOfTransactionLengthInvalidMessage;

+(NSNumber *) connectionTimeoutErrorCode;
+(NSString *) connectionTimeoutErrorMessage;

+(NSNumber *) invalidDeepSourceInfoErrorCode;
+(NSString *) invalidDeepSourceInfoErrorMessage;

+(NSNumber *) internalServerErrorCode;
+(NSString *) internalServerErrorMessage;

+(NSNumber *) formatIndicatorLengthInvalidCode;
+(NSString *) formatIndicatorLengthInvalidMessage;

+(NSNumber *) pointOfInitializeLengthInvalidCode;
+(NSString *) pointOfInitializeLengthInvalidMessage;

+(NSNumber *) merchantCategoryCodeLengthInvalidCode;
+(NSString *) merchantCategoryCodeLengthInvalidMessage;

+(NSNumber *) transactionCurrencyLengthInvalidCode;
+(NSString *) transactionCurrencyLengthInvalidMessage;

+(NSNumber *) countryCodeLengthInvalidCode;
+(NSString *) countryCodeLengthInvalidMessage;

+(NSNumber *) merchantCityLengthInvalidCode;
+(NSString *) merchantCityLengthInvalidMessage;

+(NSNumber *) crcLengthInvalidCode;
+(NSString *) crcLengthInvalidMessage;

+(NSNumber *) formatIndicatorRequiredCode;
+(NSString *) formatIndicatorRequiredMessage;

+(NSNumber *) crcRequiredCode;
+(NSString *) crcRequiredMessage;

+(NSNumber *) merchantCategoryCodeRequiredCode;
+(NSString *) merchantCategoryCodeRequiredMessage;

+(NSNumber *) countryCodeRequiredCode;
+(NSString *) countryCodeRequiredMessage;

+(NSNumber *) merchantCityRequiredCode;
+(NSString *) merchantCityRequiredMessage;

+(NSNumber *) unsupportedTransactionCurrencyCode;
+(NSString *) unsupportedTransactionCurrencyMessage;

+(NSNumber *) invalidDeepLinkURLCode;
+(NSString *) invalidDeepLinkURLMessage;

+(NSNumber *) merchantIdRequiredCode;
+(NSString *) merchantIdRequiredMessage;

+(NSNumber *) acquiringBankRequiredCode;
+(NSString *) acquiringBankRequiredMessage;

+(NSNumber *) merchantIdLengthInvalidCode;
+(NSString *) merchantIdLengthInvalidMessage;

+(NSNumber *) acquiringBankLengthInvalidCode;
+(NSString *) acquiringBankLengthInvalidMessage;

+(NSNumber *) mobileNumberLengthInvalidCode;
+(NSString *) mobileNumberLengthInvalidMessage;

+(NSNumber *) upiAccountInformationLengthInvalidCode;
+(NSString *) upiAccountInformationLengthInvalidMessage;

+(NSNumber *) upiAccountInformationNotSupportUSDCode;
+(NSString *) upiAccountInformationNotSupportUSDMessage;

+(NSNumber *) tagNotInOrderCode;
+(NSString *) tagNotInOrderMessage;

+(NSNumber *) accountInfoLengthInvalidCode;
+(NSString *) accountInfoLengthInvalidMessage;


+(NSNumber *) merchantLanguagePreferenceRequiredCode;
+(NSString *) merchantLanguagePreferenceRequiredMessage;

+(NSNumber *) merchantLanguagePreferenceLengthInvalidCode;
+(NSString *) merchantLanguagePreferenceLengthInvalidMessage;

+(NSNumber *) merchantNameAlternateLanguageRequiredCode;
+(NSString *) merchantNameAlternateLanguageRequiredMessage;

+(NSNumber *) merchantNameAlternateLanguageLengthInvalidCode;
+(NSString *) merchantNameAlternateLanguageLengthInvalidMessage;

+(NSNumber *) merchantCityAlternateLanguageLengthInvalidCode;
+(NSString *) merchantCityAlternateLanguageLengthInvalidMessage;

+(NSNumber *) expirationTimestampRequiredCode;
+(NSString *) expirationTimestampRequiredMessage;

+(NSNumber *) khqrExpiredCode;
+(NSString *) khqrExpiredMessage;

+(NSNumber *) dynamicKhqrInvalidCode;
+(NSString *) dynamicKhqrInvalidMessage;

+(NSNumber *) pointInitiationMethodInvalidCode;
+(NSString *) pointInitiationMethodInvalidMessage;

+(NSNumber *) expirationTimestampLengthInvalidCode;
+(NSString *) expirationTimestampLengthInvalidMessage;

+(NSNumber *) expirationTimestampInThePastCode;
+(NSString *) expirationTimestampInThePastMessage;

+(NSNumber *) invalidMerchantCategoryCode;
+(NSString *) invalidMerchantCategoryMessage;

@end

