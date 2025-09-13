import 'dart:convert';

/// Khqr Deep Link Data Class
class KhqrDeepLinkData {
  /// Short Link
  final String shortLink;

  /// Khqr Deep Link Data Constructor
  KhqrDeepLinkData(this.shortLink);

  /// To Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'shortLink': shortLink};
  }

  /// From Map
  factory KhqrDeepLinkData.fromMap(Map<String, dynamic> map) {
    return KhqrDeepLinkData(map['shortLink'] as String);
  }

  /// To Json
  String toJson() => json.encode(toMap());

  /// From Json
  factory KhqrDeepLinkData.fromJson(String source) =>
      KhqrDeepLinkData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'KhqrDeepLinkData(shortLink: $shortLink)';
}
