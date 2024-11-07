import 'package:khqr_sdk/src/model/deeplink_data/deeplink_data.dart';
import 'package:khqr_sdk/src/model/deeplink_info/deeplink_info.dart';
import 'package:khqr_sdk/src/model/individual_info/individual_info.dart';
import 'package:khqr_sdk/src/model/khqr_decode_data/khqr_decode_data.dart';
import 'package:khqr_sdk/src/model/merchant_info/merchant_info.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'khqr_sdk_method_channel.dart';
import '../model/khqr_data/khqr_data.dart';

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

  Future<KhqrData?> generateIndividual(IndividualInfo info) {
    throw UnimplementedError('generateIndividual() has not been implemented.');
  }

  Future<KhqrData?> generateMerchant(MerchantInfo info) {
    throw UnimplementedError('generateMerchant() has not been implemented.');
  }

  Future<bool> verify(String qrCode) {
    throw UnimplementedError('verify() has not been implemented.');
  }

  Future<KhqrDecodeData?> decode(String qrCode) {
    throw UnimplementedError('decode() has not been implemented.');
  }

  Future<DeeplinkData?> generateDeepLink(DeeplinkInfo info) {
    throw UnimplementedError('generateDeepLink() has not been implemented.');
  }
}
