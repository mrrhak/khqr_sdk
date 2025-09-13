import '../constant/emv.dart';
import '../constant/error_code.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// Transaction Amount Class
class TransactionAmount extends TagLengthString {
  /// Transaction Amount Constructor
  TransactionAmount(String tag, String value) : super(tag, value) {
    if (value.isEmpty ||
        value.length > EMV.invalidLength['amount']! ||
        value.contains('-')) {
      throw KhqrResponse.error(ErrorCode.transactionAmountInvalid);
    }
  }
}
