import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_info.freezed.dart';
part 'source_info.g.dart';

@freezed
class SourceInfo with _$SourceInfo {
  factory SourceInfo({
    required String appIconUrl,
    required String appName,
    required String appDeepLinkCallBack,
  }) = _SourceInfo;

  factory SourceInfo.fromJson(Map<String, dynamic> json) =>
      _$SourceInfoFromJson(json);
}
