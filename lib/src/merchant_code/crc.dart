import '../constant/error_code.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// CRC Class
class CRC extends TagLengthString {
  /// CRC Constructor
  CRC(String tag, String value) : super(tag, value) {
    if (value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.crcTagRequired);
    } else if (value.length > 4) {
      throw KhqrResponse.error(ErrorCode.crcLengthInvalid);
    }
  }
}
