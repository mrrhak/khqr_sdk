import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:khqr_sdk/src/model/source_info/source_info.dart';

part 'deeplink_info.freezed.dart';
part 'deeplink_info.g.dart';

/// Data class for DeeplinkInfo
@freezed
class DeeplinkInfo with _$DeeplinkInfo {
  /// Creates a instance of [DeeplinkInfo]
  factory DeeplinkInfo({
    required String qr,
    required String url,
    SourceInfo? sourceInfo,
  }) = _DeeplinkInfo;

  /// Creates a instance of [DeeplinkInfo] from json map
  factory DeeplinkInfo.fromJson(Map<String, dynamic> json) =>
      _$DeeplinkInfoFromJson(json);
}
