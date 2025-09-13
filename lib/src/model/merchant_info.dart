import 'dart:convert';

import '../enum/khqr_currency.dart';
import 'individual_info.dart';

/// Merchant Info Class
class MerchantInfo extends IndividualInfo {
  /// Merchant ID
  final String merchantId;

  /// Merchant Info Constructor
  MerchantInfo({
    required this.merchantId,
    required super.bakongAccountId,
    required super.merchantName,
    required super.acquiringBank,
    super.merchantCity,
    super.accountInformation,
    super.currency,
    super.amount,
    super.billNumber,
    super.storeLabel,
    super.terminalLabel,
    super.mobileNumber,
    super.purposeOfTransaction,
    super.languagePreference,
    super.merchantNameAlternateLanguage,
    super.merchantCityAlternateLanguage,
    super.upiMerchantAccount,
    super.expirationTimestamp,
    super.merchantCategoryCode,
  }) {
    if (merchantId.isEmpty || acquiringBank == null || acquiringBank!.isEmpty) {
      throw ArgumentError('merchantId and acquiringBank cannot be empty');
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return {'merchantId': merchantId, ...super.toMap()};
  }

  /// Creates a [MerchantInfo] instance from a map of key-value pairs.
  ///
  /// The [map] parameter must contain all required fields for a merchant:
  /// - merchantId: String
  /// - bakongAccountId: String
  /// - merchantName: String
  /// - acquiringBank: String
  ///
  /// Optional fields will be parsed if present in the map.
  factory MerchantInfo.fromMap(Map<String, dynamic> map) {
    return MerchantInfo(
      merchantId: map['merchantId'] as String,
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

  @override
  String toJson() => json.encode(toMap());

  /// Creates a [MerchantInfo] instance from a JSON string
  factory MerchantInfo.fromJson(String source) =>
      MerchantInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
