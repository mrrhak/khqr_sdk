import 'dart:convert';

/// Cut String Class
class CutString {
  /// Cut String Constructor
  CutString({
    required this.tag,
    required this.value,
    required this.slicedString,
  });

  /// Tag
  final String tag;

  /// Value
  final String value;

  /// Sliced String
  final String slicedString;

  /// To Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tag': tag,
      'value': value,
      'slicedString': slicedString,
    };
  }

  /// From Map
  factory CutString.fromMap(Map<String, dynamic> map) {
    return CutString(
      tag: map['tag'] as String,
      value: map['value'] as String,
      slicedString: map['slicedString'] as String,
    );
  }

  /// To Json
  String toJson() => json.encode(toMap());

  /// From Json
  factory CutString.fromJson(String source) =>
      CutString.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CutString(tag: $tag, value: $value, slicedString: $slicedString)';
}
