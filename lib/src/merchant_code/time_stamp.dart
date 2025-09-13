import '../constant/emv.dart';
import '../constant/error_code.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// Time Stamp Millisecond Class
class TimeStampMillisecond extends TagLengthString {
  /// Time Stamp Millisecond Constructor
  TimeStampMillisecond(String tag, int value) : super(tag, value.toString());
}

/// Time Stamp Class
class TimeStamp extends TagLengthString {
  /// Created Timestamp
  final TimeStampMillisecond? createdTimestamp;

  /// Expired Timestamp
  final TimeStampMillisecond? expiredTimestamp;

  /// Time Stamp Constructor
  TimeStamp(String tag, Map<String, dynamic>? timestamp, String? poi)
    : createdTimestamp = timestamp?['creationTimestamp'] != null
          ? TimeStampMillisecond(
              EMV.creationTimestamp,
              timestamp!['creationTimestamp'],
            )
          : null,
      expiredTimestamp = timestamp?['expirationTimestamp'] != null
          ? TimeStampMillisecond(
              EMV.expirationTimestamp,
              timestamp!['expirationTimestamp'],
            )
          : null,
      super(tag, _buildTimestampString(timestamp, poi)) {
    if (timestamp == null) return;

    final creationTimestamp = timestamp['creationTimestamp'];
    final expirationTimestamp = timestamp['expirationTimestamp'];

    if (poi == EMV.dynamicQR) {
      // Dynamic QR validation
      if (expirationTimestamp == null) {
        throw KhqrResponse.error(ErrorCode.expirationTimestampRequired);
      }

      if (expirationTimestamp.toString().length !=
          EMV.invalidLength['timestamp']) {
        throw KhqrResponse.error(ErrorCode.expirationTimestampLengthInvalid);
      }

      // Check if expiration timestamp is a valid date
      try {
        final expirationDate = DateTime.fromMillisecondsSinceEpoch(
          expirationTimestamp,
        );
        if (expirationDate.millisecondsSinceEpoch.isNaN) {
          throw KhqrResponse.error(ErrorCode.invalidDynamicKhqr);
        }
      } catch (e) {
        throw KhqrResponse.error(ErrorCode.invalidDynamicKhqr);
      }

      // Check if expiration is in the past compared to creation
      if (creationTimestamp != null &&
          expirationTimestamp < creationTimestamp) {
        throw KhqrResponse.error(ErrorCode.expirationTimestampInThePast);
      }

      // Check if QR has expired
      if (expirationTimestamp < DateTime.now().millisecondsSinceEpoch) {
        throw KhqrResponse.error(ErrorCode.khqrExpired);
      }
    }
  }

  static String _buildTimestampString(
    Map<String, dynamic>? timestamp,
    String? poi,
  ) {
    if (timestamp == null) return '';

    String timestampString = '';

    if (timestamp['creationTimestamp'] != null) {
      final createdTimestamp = TimeStampMillisecond(
        EMV.creationTimestamp,
        timestamp['creationTimestamp'],
      );
      timestampString += createdTimestamp.toString();
    }

    if (timestamp['expirationTimestamp'] != null) {
      final expiredTimestamp = TimeStampMillisecond(
        EMV.expirationTimestamp,
        timestamp['expirationTimestamp'],
      );
      timestampString += expiredTimestamp.toString();
    }

    return timestampString;
  }
}
