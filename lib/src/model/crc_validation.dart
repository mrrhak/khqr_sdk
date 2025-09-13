import 'dart:convert';

/// CRC Validation Class
class CrcValidation {
  /// Is Valid
  final bool isValid;

  /// CRC Validation Constructor
  CrcValidation(this.isValid);

  /// To Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'isValid': isValid};
  }

  /// From Map
  factory CrcValidation.fromMap(Map<String, dynamic> map) {
    return CrcValidation(map['isValid'] as bool);
  }

  /// To Json
  String toJson() => json.encode(toMap());

  /// From Json
  factory CrcValidation.fromJson(String source) =>
      CrcValidation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CrcValidation(isValid: $isValid)';
}
