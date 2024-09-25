import 'package:freezed_annotation/freezed_annotation.dart';

part 'deeplink_data.freezed.dart';
part 'deeplink_data.g.dart';

@freezed
class DeeplinkData with _$DeeplinkData {
  factory DeeplinkData({required String shortLink}) = _DeeplinkData;

  factory DeeplinkData.fromJson(Map<String, dynamic> json) =>
      _$DeeplinkDataFromJson(json);
}
