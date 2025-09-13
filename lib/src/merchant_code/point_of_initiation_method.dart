import '../constant/emv.dart';
import '../constant/error_code.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// Point of Initiation Method Class
class PointOfInitiationMethod extends TagLengthString {
  /// Point of Initiation Method Constructor
  PointOfInitiationMethod(String tag, String value) : super(tag, value) {
    if (value.length > 2) {
      throw KhqrResponse.error(ErrorCode.pointInitiationLengthInvalid);
    }
    if (value != EMV.staticQR && value != EMV.dynamicQR) {
      throw KhqrResponse.error(ErrorCode.pointOfInitiationMethodInvalid);
    }
  }
}
