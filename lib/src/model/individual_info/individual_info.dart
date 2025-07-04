import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:khqr_sdk/src/common/enum.dart';

part 'individual_info.freezed.dart';
part 'individual_info.g.dart';

/// Data class for IndividualInfo
@freezed
abstract class IndividualInfo with _$IndividualInfo {
  /// Creates a new instance of [IndividualInfo]
  factory IndividualInfo({
    required String bakongAccountId,
    String? accountInformation,
    String? acquiringBank,
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
  }) = _IndividualInfo;

  /// Creates a new instance of [IndividualInfo] from a JSON map
  factory IndividualInfo.fromJson(Map<String, dynamic> json) =>
      _$IndividualInfoFromJson(json);
}
