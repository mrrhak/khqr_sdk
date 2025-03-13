import 'package:khqr_sdk/src/model/deeplink_data/deeplink_data.dart';
import 'package:khqr_sdk/src/model/deeplink_info/deeplink_info.dart';
import 'package:khqr_sdk/src/model/individual_info/individual_info.dart';
import 'package:khqr_sdk/src/model/khqr_decoded_data/khqr_decoded_data.dart';
import 'package:khqr_sdk/src/model/merchant_info/merchant_info.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'khqr_sdk_method_channel.dart';
import '../model/khqr_data/khqr_data.dart';

/// The interface that implementations of khqr_sdk must implement.
///
/// Platform implementations should extend this class rather than implement it as `khqr_sdk`
/// does not consider newly added methods to be breaking changes.
abstract class KhqrSdkPlatform extends PlatformInterface {
  /// Constructs a KhqrSdkPlatform.
  KhqrSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static KhqrSdkPlatform _instance = MethodChannelKhqrSdk();

  /// The default instance of [KhqrSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelKhqrSdk].
  static KhqrSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KhqrSdkPlatform] when
  /// they register themselves.
  static set instance(KhqrSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Generate a KHQR for an individual.
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
  Future<KhqrData?> generateIndividual(IndividualInfo info) {
    throw UnimplementedError('generateIndividual() has not been implemented.');
  }

  /// Generate a KHQR for a merchant.
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
  Future<KhqrData?> generateMerchant(MerchantInfo info) {
    throw UnimplementedError('generateMerchant() has not been implemented.');
  }

  /// Verify a KHQR code.
  ///
  /// [qrCode] is the KHQR code to verify.
  ///
  /// Returns true if the QR code is valid, false otherwise.
  Future<bool> verify(String qrCode) {
    throw UnimplementedError('verify() has not been implemented.');
  }

  /// Decode a KHQR code.
  ///
  /// [qrCode] is the KHQR code to decode.
  ///
  /// Returns a [KhqrDecodedData] object containing the decoded data, or null if the operation fails.
  Future<KhqrDecodedData?> decode(String qrCode) {
    throw UnimplementedError('decode() has not been implemented.');
  }

  /// Decode a Non KHQR code.
  ///
  /// [qrCode] is the Non KHQR code to decode.
  ///
  /// Returns a [Map<String, dynamic>] object containing the decoded data, or null if the operation fails.
  Future<Map<String, dynamic>?> decodeNonKhqr(String qrCode) {
    throw UnimplementedError('decodeNonKhqr() has not been implemented.');
  }

  /// Generate a KHQR deeplink.
  ///
  /// [info] must contain the following information:
  /// - [DeeplinkInfo.qr]
  /// - [DeeplinkInfo.url]
  /// - [DeeplinkInfo.sourceInfo]
  ///
  /// Returns a [DeeplinkData] object containing the generated deep link, or null if the operation fails.
  Future<DeeplinkData?> generateDeepLink(DeeplinkInfo info) {
    throw UnimplementedError('generateDeepLink() has not been implemented.');
  }
}
