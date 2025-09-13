import 'dart:convert';

import '../constant/error_code.dart';
import 'khqr_status.dart';

/// Khqr Response Class
class KhqrResponse<T> {
  /// Status
  final KhqrStatus status;

  /// Data
  final T? data;

  /// Khqr Response Constructor
  KhqrResponse(this.data, ErrorCode? errorCode)
    : status = KhqrStatus(
        code: errorCode == null ? 0 : 1,
        errorCode: errorCode?.code,
        message: errorCode?.message,
      );

  /// Khqr Response Error Constructor
  KhqrResponse.error(ErrorCode errorCode)
    : status = KhqrStatus(
        code: 1,
        errorCode: errorCode.code,
        message: errorCode.message,
      ),
      data = null;

  /// Khqr Response Success Constructor
  KhqrResponse.success(this.data)
    : status = KhqrStatus(code: 0, errorCode: null, message: null);

  /// Is Success
  bool get isSuccess => status.code == 0;

  /// Is Error
  bool get isError => status.code == 1;

  /// To Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'status': status.toMap(), 'data': data};
  }

  /// To Json
  String toJson() => json.encode(toMap());
}
