import '../constant/error_code.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// Payload Format Indicator Class
class PayloadFormatIndicator extends TagLengthString {
  /// Payload Format Indicator Constructor
  PayloadFormatIndicator(String tag, String value) : super(tag, value) {
    if (value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.payloadFormatIndicatorTagRequired);
    }
    if (value.length > 2) {
      throw KhqrResponse.error(ErrorCode.payloadFormatIndicatorLengthInvalid);
    }
  }
}
