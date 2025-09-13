import '../constant/emv.dart';
import '../constant/error_code.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// Union Pay Merchant Class
class UnionPayMerchant extends TagLengthString {
  /// Union Pay Merchant Constructor
  UnionPayMerchant(String tag, String value) : super(tag, value) {
    if (value.length > EMV.invalidLength['upiMerchant']!) {
      throw KhqrResponse.error(ErrorCode.upiAccountInformationLengthInvalid);
    }
  }
}
