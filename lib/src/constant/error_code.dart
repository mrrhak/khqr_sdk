import 'dart:convert';

/// Error Code Class
class ErrorCode {
  /// Error Code
  final int code;

  /// Error Message
  final String message;

  /// Error Code Constructor
  const ErrorCode({required this.code, required this.message});

  /// Error Code to Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'code': code, 'message': message};
  }

  /// Error Code from Map
  factory ErrorCode.fromMap(Map<String, dynamic> map) {
    return ErrorCode(
      code: map['code'] as int,
      message: map['message'] as String,
    );
  }

  /// Error Code to Json
  String toJson() => json.encode(toMap());

  /// Error Code from Json
  factory ErrorCode.fromJson(String source) =>
      ErrorCode.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ErrorCode(code: $code, message: $message)';

  /// Error Code 1
  static const bakongAccountIdRequired = ErrorCode(
    code: 1,
    message: "Bakong Account ID cannot be null or empty",
  );

  /// Error Code 2
  static const merchantNameRequired = ErrorCode(
    code: 2,
    message: "Merchant name cannot be null or empty",
  );

  /// Error Code 3
  static const bakongAccountIdInvalid = ErrorCode(
    code: 3,
    message: "Bakong Account ID is invalid",
  );

  /// Error Code 4
  static const transactionAmountInvalid = ErrorCode(
    code: 4,
    message: "Amount is invalid",
  );

  /// Error Code 5
  static const merchantTypeRequired = ErrorCode(
    code: 5,
    message: "Merchant type cannot be null or empty",
  );

  /// Error Code 6
  static const bakongAccountIdLengthInvalid = ErrorCode(
    code: 6,
    message: "Bakong Account ID Length is Invalid",
  );

  /// Error Code 7
  static const merchantNameLengthInvalid = ErrorCode(
    code: 7,
    message: "Merchant Name Length is invalid",
  );

  /// Error Code 8
  static const khqrInvalid = ErrorCode(
    code: 8,
    message: "KHQR provided is invalid",
  );

  /// Error Code 9
  static const currencyTypeRequired = ErrorCode(
    code: 9,
    message: "Currency type cannot be null or empty",
  );

  /// Error Code 10
  static const billNumberLengthInvalid = ErrorCode(
    code: 10,
    message: "Bill Name Length is invalid",
  );

  /// Error Code 11
  static const storeLabelLengthInvalid = ErrorCode(
    code: 11,
    message: "Store Label Length is invalid",
  );

  /// Error Code 12
  static const terminalLabelLengthInvalid = ErrorCode(
    code: 12,
    message: "Terminal Label Length is invalid",
  );

  /// Error Code 13
  static const connectionTimeout = ErrorCode(
    code: 13,
    message:
        "Cannot reach Bakong Open API service. Please check internet connection",
  );

  /// Error Code 14
  static const invalidDeepLinkSourceInfo = ErrorCode(
    code: 14,
    message: "Source Info for Deep Link is invalid",
  );

  /// Error Code 15
  static const internalServer = ErrorCode(
    code: 15,
    message: "Internal server error",
  );

  /// Error Code 16
  static const payloadFormatIndicatorLengthInvalid = ErrorCode(
    code: 16,
    message: "Payload Format indicator Length is invalid",
  );

  /// Error Code 17
  static const pointInitiationLengthInvalid = ErrorCode(
    code: 17,
    message: "Point of initiation Length is invalid",
  );

  /// Error Code 18
  static const merchantCodeLengthInvalid = ErrorCode(
    code: 18,
    message: "Merchant code Length is invalid",
  );

  /// Error Code 19
  static const transactionCurrencyLengthInvalid = ErrorCode(
    code: 19,
    message: "Transaction currency Length is invalid",
  );

  /// Error Code 20
  static const countryCodeLengthInvalid = ErrorCode(
    code: 20,
    message: "Country code Length is invalid",
  );

  /// Error Code 21
  static const merchantCityLengthInvalid = ErrorCode(
    code: 21,
    message: "Merchant city Length is invalid",
  );

  /// Error Code 22
  static const crcLengthInvalid = ErrorCode(
    code: 22,
    message: "CRC Length is invalid",
  );

  /// Error Code 23
  static const payloadFormatIndicatorTagRequired = ErrorCode(
    code: 23,
    message: "Payload format indicator tag required",
  );

  /// Error Code 24
  static const crcTagRequired = ErrorCode(
    code: 24,
    message: "CRC tag required",
  );

  /// Error Code 25
  static const merchantCategoryTagRequired = ErrorCode(
    code: 25,
    message: "Merchant category tag required",
  );

  /// Error Code 26
  static const countryCodeTagRequired = ErrorCode(
    code: 26,
    message: "Country Code cannot be null or empty",
  );

  /// Error Code 27
  static const merchantCityTagRequired = ErrorCode(
    code: 27,
    message: "Merchant City cannot be null or empty",
  );

  /// Error Code 28
  static const unsupportedCurrency = ErrorCode(
    code: 28,
    message: "Unsupported currency",
  );

  /// Error Code 29
  static const invalidDeepLinkUrl = ErrorCode(
    code: 29,
    message: "Deep Link URL is not valid",
  );

  /// Error Code 30
  static const merchantIdRequired = ErrorCode(
    code: 30,
    message: "Merchant ID cannot be null or empty",
  );

  /// Error Code 31
  static const acquiringBankRequired = ErrorCode(
    code: 31,
    message: "Acquiring Bank cannot be null or empty",
  );

  /// Error Code 32
  static const merchantIdLengthInvalid = ErrorCode(
    code: 32,
    message: "Merchant ID Length is invalid",
  );

  /// Error Code 33
  static const acquiringBankLengthInvalid = ErrorCode(
    code: 33,
    message: "Acquiring Bank Length is invalid",
  );

  /// Error Code 34
  static const mobileNumberLengthInvalid = ErrorCode(
    code: 34,
    message: "Mobile Number Length is invalid",
  );

  /// Error Code 35
  static const accountInformationLengthInvalid = ErrorCode(
    code: 35,
    message: "Account Information Length is invalid",
  );

  /// Error Code 36
  static const tagNotInOrder = ErrorCode(
    code: 36,
    message: "Tag is not in order",
  );

  /// Error Code 37
  static const languagePreferenceRequired = ErrorCode(
    code: 37,
    message: "Language Preference cannot be null or empty",
  );

  /// Error Code 38
  static const languagePreferenceLengthInvalid = ErrorCode(
    code: 38,
    message: "Language Preference Length is invalid",
  );

  /// Error Code 39
  static const merchantNameAlternateLanguageRequired = ErrorCode(
    code: 39,
    message: "Merchant Name Alternate Language cannot be null or empty",
  );

  /// Error Code 40
  static const merchantNameAlternateLanguageLengthInvalid = ErrorCode(
    code: 40,
    message: "Merchant Name Alternate Language Length is invalid",
  );

  /// Error Code 41
  static const merchantCityAlternateLanguageLengthInvalid = ErrorCode(
    code: 41,
    message: "Merchant City Alternate Language Length is invalid",
  );

  /// Error Code 42
  static const purposeOfTransactionLengthInvalid = ErrorCode(
    code: 42,
    message: "Purpose of Transaction Length is invalid",
  );

  /// Error Code 43
  static const upiAccountInformationLengthInvalid = ErrorCode(
    code: 43,
    message: "Upi Account Information Length is invalid",
  );

  /// Error Code 44
  static const upiAccountInformationInvalidCurrency = ErrorCode(
    code: 44,
    message: "Upi Account Information Length does not accept USD",
  );

  /// Error Code 45
  static const expirationTimestampRequired = ErrorCode(
    code: 45,
    message: "Expiration timestamp is required for dynamic KHQR",
  );

  /// Error Code 46
  static const khqrExpired = ErrorCode(
    code: 46,
    message: "This dynamic KHQR has expired",
  );

  /// Error Code 47
  static const invalidDynamicKhqr = ErrorCode(
    code: 47,
    message: "This dynamic KHQR has invalid field transaction amount",
  );

  /// Error Code 48
  static const pointOfInitiationMethodInvalid = ErrorCode(
    code: 48,
    message: "Point of Initiation Method is invalid",
  );

  /// Error Code 49
  static const expirationTimestampLengthInvalid = ErrorCode(
    code: 49,
    message: "Expiration timestamp length is invalid",
  );

  /// Error Code 50
  static const expirationTimestampInThePast = ErrorCode(
    code: 50,
    message: "Expiration timestamp is in the past",
  );

  /// Error Code 51
  static const invalidMerchantCategoryCode = ErrorCode(
    code: 51,
    message: "Invalid merchant category code",
  );
}
