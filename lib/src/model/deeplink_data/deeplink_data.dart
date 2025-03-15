import 'package:freezed_annotation/freezed_annotation.dart';

part 'deeplink_data.freezed.dart';
part 'deeplink_data.g.dart';

/// Data class for DeeplinkData
@freezed
abstract class DeeplinkData with _$DeeplinkData {
  /// Creates a  new instance of [DeeplinkData]
  factory DeeplinkData({required String shortLink}) = _DeeplinkData;

  /// Creates a new instance of [DeeplinkData] from a JSON map
  factory DeeplinkData.fromJson(Map<String, dynamic> json) =>
      _$DeeplinkDataFromJson(json);
}
