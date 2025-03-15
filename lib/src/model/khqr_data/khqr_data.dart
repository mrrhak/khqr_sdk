import 'package:freezed_annotation/freezed_annotation.dart';

part 'khqr_data.freezed.dart';
part 'khqr_data.g.dart';

/// Data class for KhqrData
@freezed
abstract class KhqrData with _$KhqrData {
  /// Creates a new instance of [KhqrData]
  factory KhqrData({required String qr, required String md5}) = _KhqrData;

  /// Creates a instance of [KhqrData] from a JSON map
  factory KhqrData.fromJson(Map<String, dynamic> json) =>
      _$KhqrDataFromJson(json);
}
