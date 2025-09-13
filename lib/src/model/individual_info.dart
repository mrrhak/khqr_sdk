import 'dart:convert';

import '../enum/khqr_currency.dart';

/// Individual Info Class
class IndividualInfo {
  /// Bakong Account Id
  final String bakongAccountId;

  /// Account Information
  final String? accountInformation;

  /// Acquiring Bank
  final String? acquiringBank;

  /// Currency
  final KhqrCurrency currency;

  /// Amount
  final double? amount;

  /// Merchant Name
  final String merchantName;

  /// Merchant City
  final String merchantCity;

  /// Bill Number
  final String? billNumber;

  /// Store Label
  final String? storeLabel;

  /// Terminal Label
  final String? terminalLabel;

  /// Mobile Number
  final String? mobileNumber;

  /// Purpose of Transaction
  final String? purposeOfTransaction;

  /// Language Preference
  final String? languagePreference;

  /// Merchant Name Alternate Language
  final String? merchantNameAlternateLanguage;

  /// Merchant City Alternate Language
  final String? merchantCityAlternateLanguage;

  /// UPI Merchant Account
  final String? upiMerchantAccount;

  /// Expiration Timestamp
  final int? expirationTimestamp;

  /// Merchant Category Code
  final String? merchantCategoryCode;

  /// Individual Info Constructor
  IndividualInfo({
    required this.bakongAccountId,
    required this.merchantName,
    this.merchantCity = 'Phnom Penh',
    this.accountInformation,
    this.acquiringBank,
    this.currency = KhqrCurrency.khr,
    this.amount,
    this.billNumber,
    this.storeLabel,
    this.terminalLabel,
    this.mobileNumber,
    this.purposeOfTransaction,
    this.languagePreference,
    this.merchantNameAlternateLanguage,
    this.merchantCityAlternateLanguage,
    this.upiMerchantAccount,
    this.expirationTimestamp,
    this.merchantCategoryCode,
  }) {
    if (bakongAccountId.isEmpty ||
        merchantName.isEmpty ||
        merchantCity.isEmpty) {
      throw ArgumentError(
        'bakongAccountId, merchantName, and merchantCity cannot be empty',
      );
    }
  }

  /// To Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bakongAccountId': bakongAccountId,
      'accountInformation': accountInformation,
      'acquiringBank': acquiringBank,
      'currency': currency.value,
      'amount': amount,
      'merchantName': merchantName,
      'merchantCity': merchantCity,
      'billNumber': billNumber,
      'storeLabel': storeLabel,
      'terminalLabel': terminalLabel,
      'mobileNumber': mobileNumber,
      'purposeOfTransaction': purposeOfTransaction,
      'languagePreference': languagePreference,
      'merchantNameAlternateLanguage': merchantNameAlternateLanguage,
      'merchantCityAlternateLanguage': merchantCityAlternateLanguage,
      'upiMerchantAccount': upiMerchantAccount,
      'expirationTimestamp': expirationTimestamp,
      'merchantCategoryCode': merchantCategoryCode,
    };
  }

  /// From Map
  factory IndividualInfo.fromMap(Map<String, dynamic> map) {
    return IndividualInfo(
      bakongAccountId: map['bakongAccountId'] as String,
      accountInformation: map['accountInformation'] as String?,
      acquiringBank: map['acquiringBank'] as String?,
      currency: KhqrCurrency.values.firstWhere(
        (c) => c.value == map['currency'] as int,
      ),
      amount: map['amount'] as double?,
      merchantName: map['merchantName'] as String,
      merchantCity: map['merchantCity'] as String,
      billNumber: map['billNumber'] as String?,
      storeLabel: map['storeLabel'] as String?,
      terminalLabel: map['terminalLabel'] as String?,
      mobileNumber: map['mobileNumber'] as String?,
      purposeOfTransaction: map['purposeOfTransaction'] as String?,
      languagePreference: map['languagePreference'] as String?,
      merchantNameAlternateLanguage:
          map['merchantNameAlternateLanguage'] as String?,
      merchantCityAlternateLanguage:
          map['merchantCityAlternateLanguage'] as String?,
      upiMerchantAccount: map['upiMerchantAccount'] as String?,
      expirationTimestamp: map['expirationTimestamp'] as int?,
      merchantCategoryCode: map['merchantCategoryCode'] as String?,
    );
  }

  /// To Json
  String toJson() => json.encode(toMap());

  /// From Json
  factory IndividualInfo.fromJson(String source) =>
      IndividualInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
