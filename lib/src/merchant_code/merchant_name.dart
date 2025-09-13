import '../constant/emv.dart';
import '../constant/error_code.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// Merchant Name Class
class MerchantName extends TagLengthString {
  /// Merchant Name Constructor
  MerchantName(String tag, String value) : super(tag, value) {
    if (value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.merchantNameRequired);
    }
    if (value.length > EMV.invalidLength['merchantName']!) {
      throw KhqrResponse.error(ErrorCode.merchantNameLengthInvalid);
    }
  }
}
