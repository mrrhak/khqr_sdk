import '../constant/emv.dart';
import '../constant/error_code.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// Merchant City Class
class MerchantCity extends TagLengthString {
  /// Merchant City Constructor
  MerchantCity(String tag, String value) : super(tag, value) {
    if (value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.merchantCityTagRequired);
    }
    if (value.length > EMV.invalidLength['merchantCity']!) {
      throw KhqrResponse.error(ErrorCode.merchantCityLengthInvalid);
    }
  }
}
