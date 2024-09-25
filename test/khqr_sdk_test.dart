import 'package:flutter_test/flutter_test.dart';
import 'package:khqr_sdk/khqr_sdk.dart';
import 'package:khqr_sdk/khqr_sdk_platform_interface.dart';
import 'package:khqr_sdk/khqr_sdk_method_channel.dart';
import 'package:khqr_sdk/model/deeplink_data/deeplink_data.dart';
import 'package:khqr_sdk/model/deeplink_info/deeplink_info.dart';
import 'package:khqr_sdk/model/individual_info/individual_info.dart';
import 'package:khqr_sdk/model/khqr_data/khqr_data.dart';
import 'package:khqr_sdk/model/khqr_decode_data/khqr_decode_data.dart';
import 'package:khqr_sdk/model/merchant_info/merchant_info.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKhqrSdkPlatform
    with MockPlatformInterfaceMixin
    implements KhqrSdkPlatform {
  @override
  Future<KhqrDecodeData?> decode(String qrCode) {
    // TODO: implement decode
    throw UnimplementedError();
  }

  @override
  Future<DeeplinkData?> generateDeepLink(DeeplinkInfo info) {
    // TODO: implement generateDeepLink
    throw UnimplementedError();
  }

  @override
  Future<KhqrData?> generateIndividual(IndividualInfo info) {
    final khqrData = KhqrData(qr: 'This is QR', md5: 'This is MD5');
    return Future.value(khqrData);
  }

  @override
  Future<KhqrData?> generateMerchant(MerchantInfo info) {
    // TODO: implement generateMerchant
    throw UnimplementedError();
  }

  @override
  Future<bool> verify(String qrCode) {
    // TODO: implement verify
    throw UnimplementedError();
  }
}

void main() {
  final KhqrSdkPlatform initialPlatform = KhqrSdkPlatform.instance;

  test('MethodChannelKhqrSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKhqrSdk>());
  });

  test('generateIndividual', () async {
    KhqrSdk khqrSdkPlugin = KhqrSdk();
    MockKhqrSdkPlatform fakePlatform = MockKhqrSdkPlatform();
    KhqrSdkPlatform.instance = fakePlatform;

    final info = IndividualInfo(
      bakongAccountId: 'john_smith@devb',
      merchantName: 'John Smith',
    );

    expect(await khqrSdkPlugin.generateIndividual(info), isNotNull);
  });
}
