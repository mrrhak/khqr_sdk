import 'dart:convert';

/// Source Info Class
class SourceInfo {
  /// App Icon Url
  final String? appIconUrl;

  /// App Name
  final String? appName;

  /// App Deep Link Callback
  final String? appDeepLinkCallback;

  /// Source Info Constructor
  SourceInfo({this.appIconUrl, this.appName, this.appDeepLinkCallback});

  /// To Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appIconUrl': appIconUrl,
      'appName': appName,
      'appDeepLinkCallback': appDeepLinkCallback,
    };
  }

  /// From Map
  factory SourceInfo.fromMap(Map<String, dynamic> map) {
    return SourceInfo(
      appIconUrl: map['appIconUrl'] != null
          ? map['appIconUrl'] as String
          : null,
      appName: map['appName'] != null ? map['appName'] as String : null,
      appDeepLinkCallback: map['appDeepLinkCallback'] != null
          ? map['appDeepLinkCallback'] as String
          : null,
    );
  }

  /// To Json
  String toJson() => json.encode(toMap());

  /// From Json
  factory SourceInfo.fromJson(String source) =>
      SourceInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SourceInfo(appIconUrl: $appIconUrl, appName: $appName, appDeepLinkCallback: $appDeepLinkCallback)';
}
