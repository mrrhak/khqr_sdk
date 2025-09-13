import '../constant/emv.dart';
import '../constant/error_code.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// Merchant Category Code Class
class MerchantCategoryCode extends TagLengthString {
  /// Merchant Category Code Constructor
  MerchantCategoryCode(String tag, String value) : super(tag, value) {
    if (value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.merchantCategoryTagRequired);
    }
    if (value.length > EMV.invalidLength['merchantCategoryCode']!) {
      throw KhqrResponse.error(ErrorCode.merchantCodeLengthInvalid);
    }

    final numericRegex = RegExp(r'^\d+$');
    if (!numericRegex.hasMatch(value)) {
      throw KhqrResponse.error(ErrorCode.invalidMerchantCategoryCode);
    }

    final mcc = int.tryParse(value);
    if (mcc == null || mcc < 0 || mcc > 9999) {
      throw KhqrResponse.error(ErrorCode.invalidMerchantCategoryCode);
    }
  }
}
