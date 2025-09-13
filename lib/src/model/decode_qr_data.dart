import 'dart:convert';

/// Decode Qr Data Class
class DecodeQrData {
  /// Merchant Type
  final String? merchantType;

  /// Bakong Account ID
  final String? bakongAccountID;

  /// Account Information
  final String? accountInformation;

  /// Merchant ID
  final String? merchantID;

  /// Acquiring Bank
  final String? acquiringBank;

  /// Bill Number
  final String? billNumber;

  /// Mobile Number
  final String? mobileNumber;

  /// Store Label
  final String? storeLabel;

  /// Terminal Label
  final String? terminalLabel;

  /// Purpose of Transaction
  final String? purposeOfTransaction;

  /// Language Preference
  final String? languagePreference;

  /// Merchant Name Alternate Language
  final String? merchantNameAlternateLanguage;

  /// Merchant City Alternate Language
  final String? merchantCityAlternateLanguage;

  /// Creation Timestamp
  final String? creationTimestamp;

  /// Expiration Timestamp
  final String? expirationTimestamp;

  /// Payload Format Indicator
  final String? payloadFormatIndicator;

  /// Point of Initiation Method
  final String? pointOfInitiationMethod;

  /// Union Pay Merchant
  final String? unionPayMerchant;

  /// Merchant Category Code
  final String? merchantCategoryCode;

  /// Transaction Currency
  final String? transactionCurrency;

  /// Transaction Amount
  final String? transactionAmount;

  /// Country Code
  final String? countryCode;

  /// Merchant Name
  final String? merchantName;

  /// Merchant City
  final String? merchantCity;

  /// CRC
  final String? crc;

  /// Decode Qr Data Constructor
  DecodeQrData({
    this.merchantType,
    this.bakongAccountID,
    this.accountInformation,
    this.merchantID,
    this.acquiringBank,
    this.billNumber,
    this.mobileNumber,
    this.storeLabel,
    this.terminalLabel,
    this.purposeOfTransaction,
    this.languagePreference,
    this.merchantNameAlternateLanguage,
    this.merchantCityAlternateLanguage,
    this.creationTimestamp,
    this.expirationTimestamp,
    this.payloadFormatIndicator,
    this.pointOfInitiationMethod,
    this.unionPayMerchant,
    this.merchantCategoryCode,
    this.transactionCurrency,
    this.transactionAmount,
    this.countryCode,
    this.merchantName,
    this.merchantCity,
    this.crc,
  });

  /// Decode Qr Data to Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'merchantType': merchantType,
      'bakongAccountID': bakongAccountID,
      'accountInformation': accountInformation,
      'merchantID': merchantID,
      'acquiringBank': acquiringBank,
      'billNumber': billNumber,
      'mobileNumber': mobileNumber,
      'storeLabel': storeLabel,
      'terminalLabel': terminalLabel,
      'purposeOfTransaction': purposeOfTransaction,
      'languagePreference': languagePreference,
      'merchantNameAlternateLanguage': merchantNameAlternateLanguage,
      'merchantCityAlternateLanguage': merchantCityAlternateLanguage,
      'creationTimestamp': creationTimestamp,
      'expirationTimestamp': expirationTimestamp,
      'payloadFormatIndicator': payloadFormatIndicator,
      'pointOfInitiationMethod': pointOfInitiationMethod,
      'unionPayMerchant': unionPayMerchant,
      'merchantCategoryCode': merchantCategoryCode,
      'transactionCurrency': transactionCurrency,
      'transactionAmount': transactionAmount,
      'countryCode': countryCode,
      'merchantName': merchantName,
      'merchantCity': merchantCity,
      'crc': crc,
    };
  }

  /// Decode Qr Data from Map
  factory DecodeQrData.fromMap(Map<String, dynamic> map) {
    return DecodeQrData(
      merchantType: map['merchantType'] as String?,
      bakongAccountID: map['bakongAccountID'] as String?,
      accountInformation: map['accountInformation'] as String?,
      merchantID: map['merchantID'] as String?,
      acquiringBank: map['acquiringBank'] as String?,
      billNumber: map['billNumber'] as String?,
      mobileNumber: map['mobileNumber'] as String?,
      storeLabel: map['storeLabel'] as String?,
      terminalLabel: map['terminalLabel'] as String?,
      purposeOfTransaction: map['purposeOfTransaction'] as String?,
      languagePreference: map['languagePreference'] as String?,
      merchantNameAlternateLanguage:
          map['merchantNameAlternateLanguage'] as String?,
      merchantCityAlternateLanguage:
          map['merchantCityAlternateLanguage'] as String?,
      creationTimestamp: map['creationTimestamp'] as String?,
      expirationTimestamp: map['expirationTimestamp'] as String?,
      payloadFormatIndicator: map['payloadFormatIndicator'] as String?,
      pointOfInitiationMethod: map['pointOfInitiationMethod'] as String?,
      unionPayMerchant: map['unionPayMerchant'] as String?,
      merchantCategoryCode: map['merchantCategoryCode'] as String?,
      transactionCurrency: map['transactionCurrency'] as String?,
      transactionAmount: map['transactionAmount'] as String?,
      countryCode: map['countryCode'] as String?,
      merchantName: map['merchantName'] as String?,
      merchantCity: map['merchantCity'] as String?,
      crc: map['crc'] as String?,
    );
  }

  /// Decode Qr Data to Json
  String toJson() => json.encode(toMap());

  /// Decode Qr Data from Json
  factory DecodeQrData.fromJson(String source) =>
      DecodeQrData.fromMap(json.decode(source) as Map<String, dynamic>);
}
