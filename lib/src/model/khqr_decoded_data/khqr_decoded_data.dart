import 'package:freezed_annotation/freezed_annotation.dart';

part 'khqr_decoded_data.freezed.dart';
part 'khqr_decoded_data.g.dart';

/// Data class for KhqrDecodedData
@freezed
abstract class KhqrDecodedData with _$KhqrDecodedData {
  /// Creates new instance of [KhqrDecodedData]
  factory KhqrDecodedData({
    String? payloadFormatIndicator,
    String? pointOfInitiationMethod,
    String? bakongAccountId,
    String? merchantId,
    String? accountInformation,
    String? acquiringBank,
    String? merchantType,
    String? transactionCurrency,
    String? merchantName,
    String? transactionAmount,
    String? merchantCategoryCode,
    String? countryCode,
    String? merchantCity,
    String? billNumber,
    String? storeLabel,
    String? terminalLabel,
    String? mobileNumber,
    String? crc,
    String? upiAccountInformation,
    String? purposeOfTransaction,
    String? merchantAlternateLanguagePreference,
    String? merchantNameAlternateLanguage,
    String? merchantCityAlternateLanguage,
    String? creationTimestamp,
    String? expirationTimestamp,
  }) = _KhqrDecodedData;

  /// Creates new instance of [KhqrDecodedData] from JSON map
  factory KhqrDecodedData.fromJson(Map<String, dynamic> json) =>
      _$KhqrDecodedDataFromJson(json);
}
