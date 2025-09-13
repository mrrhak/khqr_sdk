import 'dart:convert';

import '../helper/helper.dart';

/// Khqr Data Class
class KhqrData {
  /// KHQR String
  final String qr;

  /// MD5 Hash
  final String md5Hash;

  /// Khqr Data Constructor
  KhqrData(this.qr) : md5Hash = Helper.generateMd5(qr);

  /// To Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'qr': qr, 'md5Hash': md5Hash};
  }

  /// From Map
  factory KhqrData.fromMap(Map<String, dynamic> map) {
    return KhqrData(map['qr'] as String);
  }

  /// To Json
  String toJson() => json.encode(toMap());

  /// From Json
  factory KhqrData.fromJson(String source) =>
      KhqrData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'KhqrData(qr: $qr, md5Hash: $md5Hash)';
}
