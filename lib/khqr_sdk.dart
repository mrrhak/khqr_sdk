import 'package:khqr_sdk/model/deeplink_data/deeplink_data.dart';
import 'package:khqr_sdk/model/deeplink_info/deeplink_info.dart';
import 'package:khqr_sdk/model/individual_info/individual_info.dart';
import 'package:khqr_sdk/model/khqr_decode_data/khqr_decode_data.dart';
import 'package:khqr_sdk/model/merchant_info/merchant_info.dart';

import 'khqr_sdk_platform_interface.dart';
import 'model/khqr_data/khqr_data.dart';

export 'package:khqr_sdk/util/money_formatter_util.dart'
    hide MoneyFormatterUtil;
export 'package:khqr_sdk/model/individual_info/individual_info.dart';
export 'package:khqr_sdk/model/merchant_info/merchant_info.dart';
export 'package:khqr_sdk/model/source_info/source_info.dart';
export 'package:khqr_sdk/model/deeplink_info/deeplink_info.dart';
export 'widget/khqr_card_widget.dart';
export 'common/enum.dart';

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

  Future<KhqrDecodeData?> decode(String qrCode) async {
    return await KhqrSdkPlatform.instance.decode(qrCode);
  }

  Future<DeeplinkData?> generateDeepLink(DeeplinkInfo info) async {
    return await KhqrSdkPlatform.instance.generateDeepLink(info);
  }
}
