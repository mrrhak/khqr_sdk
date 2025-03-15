import 'src/khqr_sdk_platform_interface/khqr_sdk_platform_interface.dart';
import 'src/model/individual_info/individual_info.dart';
import 'src/model/merchant_info/merchant_info.dart';
import 'src/model/deeplink_info/deeplink_info.dart';
import 'src/model/khqr_data/khqr_data.dart';
import 'src/model/khqr_decoded_data/khqr_decoded_data.dart';
import 'src/model/deeplink_data/deeplink_data.dart';

export 'src/model/individual_info/individual_info.dart';
export 'src/model/merchant_info/merchant_info.dart';
export 'src/model/deeplink_info/deeplink_info.dart';
export 'src/model/source_info/source_info.dart';
export 'src/model/khqr_data/khqr_data.dart';
export 'src/model/khqr_decoded_data/khqr_decoded_data.dart';
export 'src/model/deeplink_data/deeplink_data.dart';
export 'src/widget/khqr_card_widget.dart';
export 'src/common/enum.dart';

/// KHQR SDK class to generate, verify and decode QR codes
class KhqrSdk {
  /// Generate a KHQR for an individual
  ///
  /// [info] must contain the following information:
  /// - [IndividualInfo.bakongAccountId]
  /// - [IndividualInfo.merchantName]
  /// - [IndividualInfo.amount]
  /// - [IndividualInfo.currency] (optional, default to KHR)
  /// - [IndividualInfo.accountInformation] (optional)
  /// - [IndividualInfo.acquiringBank] (optional)
  /// - [IndividualInfo.merchantCity] (optional)
  /// - [IndividualInfo.billNumber] (optional)
  /// - [IndividualInfo.mobileNumber] (optional)
  /// - [IndividualInfo.storeLabel] (optional)
  /// - [IndividualInfo.terminalLabel] (optional)
  /// - [IndividualInfo.purposeOfTransaction] (optional)
  /// - [IndividualInfo.upiAccountInformation] (optional)
  /// - [IndividualInfo.merchantAlternateLanguagePreference] (optional)
  /// - [IndividualInfo.merchantNameAlternateLanguage] (optional)
  /// - [IndividualInfo.merchantCityAlternateLanguage] (optional)
  /// - [IndividualInfo.expirationTimestamp] (optional)
  ///
  /// Returns a [KhqrData] object containing the generated KHQR code, or null if the operation fails.
  Future<KhqrData?> generateIndividual(IndividualInfo info) async {
    return await KhqrSdkPlatform.instance.generateIndividual(info);
  }

  /// Generate a KHQR for a merchant
  ///
  /// [info] must contain the following information:
  /// - [MerchantInfo.bakongAccountId]
  /// - [MerchantInfo.acquiringBank]
  /// - [MerchantInfo.merchantId]
  /// - [MerchantInfo.merchantName]
  /// - [MerchantInfo.amount]
  /// - [MerchantInfo.currency] (optional, default to KHR)
  /// - [MerchantInfo.merchantCity] (optional)
  /// - [MerchantInfo.billNumber] (optional)
  /// - [MerchantInfo.mobileNumber] (optional)
  /// - [MerchantInfo.storeLabel] (optional)
  /// - [MerchantInfo.terminalLabel] (optional)
  /// - [MerchantInfo.purposeOfTransaction] (optional)
  /// - [MerchantInfo.upiAccountInformation] (optional)
  /// - [MerchantInfo.merchantAlternateLanguagePreference] (optional)
  /// - [MerchantInfo.merchantNameAlternateLanguage] (optional)
  /// - [MerchantInfo.merchantCityAlternateLanguage] (optional)
  /// - [MerchantInfo.expirationTimestamp] (optional)
  ///
  /// Returns a [KhqrData] object containing the generated KHQR code, or null if the operation fails.
  Future<KhqrData?> generateMerchant(MerchantInfo info) async {
    return await KhqrSdkPlatform.instance.generateMerchant(info);
  }

  /// Verify a KHQR code.
  ///
  /// [qrCode] is the KHQR code to verify.
  ///
  /// Returns true if the QR code is valid, false otherwise.
  Future<bool> verify(String qrCode) async {
    return await KhqrSdkPlatform.instance.verify(qrCode);
  }

  /// Decode a KHQR code.
  ///
  /// [qrCode] is the KHQR code to decode.
  ///
  /// Returns a [KhqrDecodedData] object containing the decoded data, or null if the operation fails.
  Future<KhqrDecodedData?> decode(String qrCode) async {
    return await KhqrSdkPlatform.instance.decode(qrCode);
  }

  /// Decode a Non KHQR code.
  ///
  /// [qrCode] is the Non KHQR code to decode.
  ///
  /// Returns a [Map<String, dynamic>] object containing the decoded data, or null if the operation fails.
  ///
  /// Note: Currently available on iOS only
  Future<Map<String, dynamic>?> decodeNonKhqr(String qrCode) async {
    return await KhqrSdkPlatform.instance.decodeNonKhqr(qrCode);
  }

  /// Generate a KHQR deeplink.
  ///
  /// [info] must contain the following information:
  /// - [DeeplinkInfo.qr]
  /// - [DeeplinkInfo.url]
  /// - [DeeplinkInfo.sourceInfo]
  ///
  /// Returns a [DeeplinkData] object containing the generated deep link, or null if the operation fails.
  Future<DeeplinkData?> generateDeepLink(DeeplinkInfo info) async {
    return await KhqrSdkPlatform.instance.generateDeepLink(info);
  }
}
