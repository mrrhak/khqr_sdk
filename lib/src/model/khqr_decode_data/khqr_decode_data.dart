import 'package:freezed_annotation/freezed_annotation.dart';

part 'khqr_decode_data.freezed.dart';
part 'khqr_decode_data.g.dart';

@freezed
class KhqrDecodeData with _$KhqrDecodeData {
  factory KhqrDecodeData({
    String? payloadFormatIndicator,
    String? pointOfInitiationMethod,
    @JsonKey(name: 'bakongAccountID') required String bakongAccountId,
    String? merchantId,
    String? accountInformation,
    String? acquiringBank,
    String? merchantType,
    String? transactionCurrency,
    required String merchantName,
    String? transactionAmount,
    String? merchantCategoryCode,
    String? countryCode,
    String? merchantCity,
    String? billNumber,
    String? storeLabel,
    String? terminalLabel,
    String? mobileNumber,
    String? timestamp,
    String? crc,
    String? upiAccountInformation,
    String? purposeOfTransaction,
    String? merchantAlternateLanguagePreference,
    String? merchantNameAlternateLanguage,
    String? merchantCityAlternateLanguage,
  }) = _KhqrDecodeData;

  factory KhqrDecodeData.fromJson(Map<String, dynamic> json) =>
      _$KhqrDecodeDataFromJson(json);
}
