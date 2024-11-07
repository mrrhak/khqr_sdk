import 'package:freezed_annotation/freezed_annotation.dart';

part 'khqr_data.freezed.dart';
part 'khqr_data.g.dart';

@freezed
class KhqrData with _$KhqrData {
  factory KhqrData({
    required String qr,
    required String md5,
  }) = _KhqrData;

  factory KhqrData.fromJson(Map<String, dynamic> json) =>
      _$KhqrDataFromJson(json);
}
