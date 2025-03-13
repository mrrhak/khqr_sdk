import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_info.freezed.dart';
part 'source_info.g.dart';

/// Data class for SourceInfo
@freezed
abstract class SourceInfo with _$SourceInfo {
  /// Creates a new instance of [SourceInfo]
  factory SourceInfo({
    required String appIconUrl,
    required String appName,
    required String appDeepLinkCallBack,
  }) = _SourceInfo;

  /// Creates a new instance of [SourceInfo] from a JSON map
  factory SourceInfo.fromJson(Map<String, dynamic> json) =>
      _$SourceInfoFromJson(json);
}
