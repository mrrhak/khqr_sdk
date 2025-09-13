/// EMV is a class that provides constants for EMV.
class EMV {
  /// Payload Format Indicator (00)
  static const String payloadFormatIndicator = "00";

  /// Default Payload Format Indicator (01)
  static const String defaultPayloadFormatIndicator = "01";

  /// Point of Initiation Method (01)
  static const String pointOfInitiationMethod = "01";

  /// Static QR (11)
  static const String staticQR = "11";

  /// Dynamic QR (12)
  static const String dynamicQR = "12";

  /// Merchant Account Information (29)
  static const String merchantAccountInformationIndividual = "29";

  /// Merchant Account Information (30)
  static const String merchantAccountInformationMerchant = "30";

  /// Bakong Account Identifier (00)
  static const String bakongAccountIdentifier = "00";

  /// Merchant Account Information Merchant ID (01)
  static const String merchantAccountInformationMerchantId = "01";

  /// Individual Account Information (01)
  static const String individualAccountInformation = "01";

  /// Merchant Account Information Acquiring Bank (02)
  static const String merchantAccountInformationAcquiringBank = "02";

  /// Merchant Category Code (52)
  static const String merchantCategoryCode = "52";

  /// Default Merchant Category Code (5999)
  static const String defaultMerchantCategoryCode = "5999";

  /// Transaction Currency (53)
  static const String transactionCurrency = "53";

  /// Transaction Amount (54)
  static const String transactionAmount = "54";

  /// Default Transaction Amount (0)
  static const String defaultTransactionAmount = "0";

  /// Country Code (58)
  static const String countryCode = "58";

  /// Default Country Code (KH)
  static const String defaultCountryCode = "KH";

  /// Merchant Name (59)
  static const String merchantName = "59";

  /// Merchant City (60)
  static const String merchantCity = "60";

  /// Default Merchant City (Phnom Penh)
  static const String defaultMerchantCity = "Phnom Penh";

  /// CRC (63)
  static const String crc = "63";

  /// CRC Length (04)
  static const String crcLength = "04";

  /// Additional Data Tag (62)
  static const String additionalDataTag = "62";

  /// Bill Number (01)
  static const String billNumberTag = "01";

  /// Additional Data Field Mobile Number (02)
  static const String additionalDataFieldMobileNumber = "02";

  /// Store Label (03)
  static const String storeLabelTag = "03";

  /// Terminal Label (07)
  static const String terminalTag = "07";

  /// Purpose of Transaction (08)
  static const String purposeOfTransaction = "08";

  /// Timestamp (99)
  static const String timestampTag = "99";

  /// Creation Timestamp (00)
  static const String creationTimestamp = "00";

  /// Expiration Timestamp (01)
  static const String expirationTimestamp = "01";

  /// Merchant Information Language Template (64)
  static const String merchantInformationLanguageTemplate = "64";

  /// Language Preference (00)
  static const String languagePreference = "00";

  /// Merchant Name Alternate Language (01)
  static const String merchantNameAlternateLanguage = "01";

  /// Merchant City Alternate Language (02)
  static const String merchantCityAlternateLanguage = "02";

  /// UnionPay Merchant Account (15)
  static const String unionPayMerchantAccount = "15";

  /// Invalid Length
  static const Map<String, int> invalidLength = {
    'khqr': 12,
    'merchantName': 25,
    'bakongAccount': 32,
    'amount': 13,
    'countryCode': 3,
    'merchantCategoryCode': 4,
    'merchantCity': 15,
    'timestamp': 13,
    'transactionAmount': 14,
    'transactionCurrency': 3,
    'billNumber': 25,
    'storeLabel': 25,
    'terminalLabel': 25,
    'purposeOfTransaction': 25,
    'merchantId': 32,
    'acquiringBank': 32,
    'mobileNumber': 25,
    'accountInformation': 32,
    'merchantInformationLanguageTemplate': 99,
    'upiMerchant': 99,
    'languagePreference': 2,
    'merchantNameAlternateLanguage': 25,
    'merchantCityAlternateLanguage': 15,
  };
}
