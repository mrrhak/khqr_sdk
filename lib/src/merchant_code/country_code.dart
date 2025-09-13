import '../constant/emv.dart';
import '../constant/error_code.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// Country Code Class
class CountryCode extends TagLengthString {
  /// Country Code Constructor
  CountryCode(String tag, String value) : super(tag, value) {
    if (value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.countryCodeTagRequired);
    }
    if (value.length > EMV.invalidLength['countryCode']!) {
      throw KhqrResponse.error(ErrorCode.countryCodeLengthInvalid);
    }
  }
}
