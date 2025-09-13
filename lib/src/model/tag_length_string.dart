import 'dart:convert';

/// Tag Length String Class
class TagLengthString {
  /// Tag
  final String tag;

  /// Value
  final String value;

  /// Length
  final String length;

  /// Tag Length String Constructor
  TagLengthString(this.tag, this.value)
    : length = value.length < 10 ? '0${value.length}' : value.length.toString();

  /// To Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'tag': tag, 'value': value, 'length': length};
  }

  /// From Map
  factory TagLengthString.fromMap(Map<String, dynamic> map) {
    return TagLengthString(map['tag'] as String, map['value'] as String);
  }

  /// To Json
  String toJson() => json.encode(toMap());

  /// From Json
  factory TagLengthString.fromJson(String source) =>
      TagLengthString.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '$tag$length$value';
  }
}
