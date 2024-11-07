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

class KhqrSdk {
  Future<KhqrData?> generateIndividual(IndividualInfo info) async {
    return await KhqrSdkPlatform.instance.generateIndividual(info);
  }

  Future<KhqrData?> generateMerchant(MerchantInfo info) async {
    return await KhqrSdkPlatform.instance.generateMerchant(info);
  }

  Future<bool> verify(String qrCode) async {
    return await KhqrSdkPlatform.instance.verify(qrCode);
  }

  Future<KhqrDecodedData?> decode(String qrCode) async {
    return await KhqrSdkPlatform.instance.decode(qrCode);
  }

  Future<DeeplinkData?> generateDeepLink(DeeplinkInfo info) async {
    return await KhqrSdkPlatform.instance.generateDeepLink(info);
  }
}
