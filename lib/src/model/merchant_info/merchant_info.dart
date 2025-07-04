import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:khqr_sdk/src/common/enum.dart';

part 'merchant_info.freezed.dart';
part 'merchant_info.g.dart';

/// Data class for MerchantInfo
@freezed
abstract class MerchantInfo with _$MerchantInfo {
  /// Creates a new instance of [MerchantInfo]
  factory MerchantInfo({
    required String bakongAccountId,
    required String merchantId,
    required String acquiringBank,
    @Default(KhqrCurrency.khr) KhqrCurrency currency,
    required double amount,
    required String merchantName,
    @Default('Phnom Penh') String merchantCity,
    String? billNumber,
    String? mobileNumber,
    String? storeLabel,
    String? terminalLabel,
    String? purposeOfTransaction,
    String? upiAccountInformation,
    String? merchantAlternateLanguagePreference,
    String? merchantNameAlternateLanguage,
    String? merchantCityAlternateLanguage,
    @Default('5999') String merchantCategoryCode,
    int? expirationTimestamp,
  }) = _MerchantInfo;

  /// Creates a new instance of [MerchantInfo] from a JSON map
  factory MerchantInfo.fromJson(Map<String, dynamic> json) =>
      _$MerchantInfoFromJson(json);
}
