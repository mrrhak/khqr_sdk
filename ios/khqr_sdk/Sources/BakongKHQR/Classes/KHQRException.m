//
//  KHQRError.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/16/20.
//
#import "KHQRException.h"
#import "ErrorConstants.h"

@implementation KHQRException

@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize reason = _reason;

- (nonnull instancetype)initWithReason:(KHQRExceptionReasons)reason
                             errorCode:(NSNumber *_Nullable)code {
    
    NSString * message = [KHQRException getMessageByReason: reason];
    
    if (self = [super initWithName:@"KHQRException"  reason: message userInfo:nil]) {
        _reason = reason;
        _errorCode = code;
        _message = message;
    }
    return self;
}

- (BOOL) isEqualTo: (KHQRException *)exception {
    return (exception.errorCode == _errorCode &&
            exception.reason == _reason &&
            exception.message == _message);
}

+ (NSString *) getMessageByReason: (KHQRExceptionReasons) reason {
    NSString * message;
    switch (reason) {
        case accountIdRequired:
            message = [ErrorConstants accountIdRequiredMessage];
            break;
        case merchantNameRequired:
            message = [ErrorConstants merchantNameRequiredMessage];
            break;
        case tranAmountInvalid:
            message = [ErrorConstants tranAmountInvalidMessage];
            break;
        case accountIdInvalid:
            message = [ErrorConstants accountIdInvalidMessage];
            break;
        case merchantTypeRequired:
            message = [ErrorConstants merchantTypeRequiredMessage];
            break;
        case accountIdLengthInvalid:
            message = [ErrorConstants accountIdLengthInvalidMessage];
            break;
        case qrInvalid:
            message = [ErrorConstants qrInvalidMessage];
            break;
        case merchantNameLengthInvalid:
            message = [ErrorConstants merchantNameLengthInvalidMessage];
            break;
        case currencyTypeRequired:
            message = [ErrorConstants currencyTypeRequiredMessage];
            break;
        case billNumberLengthInvalid:
            message = [ErrorConstants billNumberLengthInvalidMessage];
            break;
        case storeLabelLengthInvalid:
            message = [ErrorConstants storeLabelLengthInvalidMessage];
            break;
        case terminalLabelLengthInvalid:
            message = [ErrorConstants terminalLabelLengthInvalidMessage];
            break;
        case purposeOfTransactionLengthInvalid:
            message = [ErrorConstants purposeOfTransactionLengthInvalidMessage];
            break;
        case formatIndicatorLengthInvalid:
            message = [ErrorConstants formatIndicatorLengthInvalidMessage];
            break;
        case pointOfInitializeLengthInvalid:
            message = [ErrorConstants pointOfInitializeLengthInvalidMessage];
            break;
        case merchantCategoryCodeLengthInvalid:
            message = [ErrorConstants merchantCategoryCodeLengthInvalidMessage];
            break;
        case transactionCurrencyLengthInvalid:
            message = [ErrorConstants transactionCurrencyLengthInvalidMessage];
            break;
        case countryCodeLengthInvalid:
            message = [ErrorConstants countryCodeLengthInvalidMessage];
            break;
        case merchantCityLengthInvalid:
            message = [ErrorConstants merchantCityLengthInvalidMessage];
            break;
        case crcLengthInvalid:
            message = [ErrorConstants crcLengthInvalidMessage];
            break;
        case formatIndicatorRequired:
            message = [ErrorConstants formatIndicatorRequiredMessage];
            break;
        case crcRequired:
            message = [ErrorConstants crcRequiredMessage];
            break;
        case merchantCategoryCodeRequired:
            message = [ErrorConstants merchantCategoryCodeRequiredMessage];
            break;
        case countryCodeRequired:
            message = [ErrorConstants countryCodeRequiredMessage];
            break;
        case merchantCityRequired:
            message = [ErrorConstants merchantCityRequiredMessage];
            break;
        case unsupportedTransactionCurrency:
            message = [ErrorConstants unsupportedTransactionCurrencyMessage];
            break;
        case invalidDeepLinkURL:
            message = [ErrorConstants invalidDeepLinkURLMessage];
            break;
        case merchantIdrequired:
            message = [ErrorConstants merchantIdRequiredMessage];
            break;
        case acquiringBankRequired:
            message = [ErrorConstants acquiringBankRequiredMessage];
            break;
        case merchantIdLengthInvalid:
            message = [ErrorConstants merchantIdLengthInvalidMessage];
            break;
        case accountInfoLengthInvalid:
            message = [ErrorConstants accountInfoLengthInvalidMessage];
            break;
        case acquiringBankLengthInvalid:
            message = [ErrorConstants acquiringBankLengthInvalidMessage];
            break;
        case mobileNumberLengthInvalid:
            message = [ErrorConstants mobileNumberLengthInvalidMessage];
            break;
        case upiAccountInformationLengthInvalid:
            message = [ErrorConstants upiAccountInformationLengthInvalidMessage];
            break;
        case tagNotInOrder:
            message = [ErrorConstants tagNotInOrderMessage];
            break;
        case merchantLanguagePreferenceRequired:
            message = [ErrorConstants merchantLanguagePreferenceRequiredMessage];
            break;
        case merchantLanguagePreferenceLengthInvalid:
            message = [ErrorConstants merchantLanguagePreferenceLengthInvalidMessage];
            break;
        case merchantNameAlternateLanguageRequired:
            message = [ErrorConstants merchantNameAlternateLanguageRequiredMessage];
            break;
        case merchantNameAlternateLanguageLengthInvalid:
            message = [ErrorConstants merchantNameAlternateLanguageLengthInvalidMessage];
            break;
        case merchantCityAlternateLanguageLengthInvalid:
            message = [ErrorConstants merchantCityAlternateLanguageLengthInvalidMessage];
            break;
        case upiAccountInformationNotSupportUSD:
            message = [ErrorConstants upiAccountInformationNotSupportUSDMessage];
            break;
        case expirationTimestampRequired:
            message = [ErrorConstants expirationTimestampRequiredMessage];
            break;
        case khqrExpired:
            message = [ErrorConstants khqrExpiredMessage];
            break;
        case invalidDynamicKhqr:
            message = [ErrorConstants dynamicKhqrInvalidMessage];
            break;
        case pointInitiationMethodInvalid:
            message = [ErrorConstants pointInitiationMethodInvalidMessage];
            break;
        case expirationTimestampLengthInvalid:
            message = [ErrorConstants expirationTimestampLengthInvalidMessage];
            break;
        case expirationTimestampInThePast:
            message = [ErrorConstants expirationTimestampInThePastMessage];
            break;
        case merchantCategoryCodeInvalidValue:
            message = [ErrorConstants invalidMerchantCategoryMessage];
        default:
            break;
    }
    return message;
}

@end
