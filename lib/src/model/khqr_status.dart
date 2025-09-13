import 'dart:convert';

/// Khqr Status Class
class KhqrStatus {
  /// Code
  final int code;

  /// Error Code
  final int? errorCode;

  /// Message
  final String? message;

  /// Khqr Status Constructor
  KhqrStatus({required this.code, this.errorCode, this.message});

  /// To Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'errorCode': errorCode,
      'message': message,
    };
  }

  /// From Map
  factory KhqrStatus.fromMap(Map<String, dynamic> map) {
    return KhqrStatus(
      code: map['code'] as int,
      errorCode: map['errorCode'] != null ? map['errorCode'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  /// To Json
  String toJson() => json.encode(toMap());

  /// From Json
  factory KhqrStatus.fromJson(String source) =>
      KhqrStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'KhqrStatus(code: $code, errorCode: $errorCode, message: $message)';
}
