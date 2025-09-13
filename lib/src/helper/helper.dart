import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import '../constant/error_code.dart';
import '../constant/khqr_tag.dart';
import '../model/cut_string.dart';
import '../model/khqr_response.dart';

/// Helper Class
class Helper {
  /// Cut String
  static CutString cutString(String input) {
    const sliceIndex = 2;

    final tag = input.substring(0, sliceIndex);
    final length = int.parse(input.substring(sliceIndex, sliceIndex * 2));
    final value = input.substring(sliceIndex * 2, sliceIndex * 2 + length);
    final slicedString = input.substring(sliceIndex * 2 + length);

    return CutString(tag: tag, value: value, slicedString: slicedString);
  }

  /// Remove Empty Elements
  static Map<String, dynamic> removeEmptyElements(Map<String, dynamic> map) {
    return Map.fromEntries(
      map.entries.where(
        (entry) =>
            entry.value != null &&
            entry.value != '' &&
            entry.value.toString().isNotEmpty,
      ),
    );
  }

  /// Generate Md5
  static String generateMd5(String input) {
    var bytes = utf8.encode(input);
    var digest = md5.convert(bytes);
    return digest.toString();
  }

  /// Check Crc Reg Exp
  static bool checkCrcRegExp(String crc) {
    final crcRegExp = RegExp(r'6304[A-Fa-f0-9]{4}$');
    return crcRegExp.hasMatch(crc);
  }

  /// Is Valid Url
  static bool isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.path == '/v1/generate_deeplink_by_qr';
    } catch (e) {
      return false;
    }
  }

  /// Is Numeric
  static bool isNumeric(String value) {
    return RegExp(r'^\d+').hasMatch(value);
  }

  /// Is Valid Tag
  static bool isValidTag(String tag, int length, String value) {
    return isNumeric(tag) && length == value.length;
  }

  /// Find Tag
  static KhqrTag findTag(List<KhqrTag> tags, String tag) {
    return tags.firstWhere((e) => e.tag == tag);
  }

  /// Call Deep Link API
  static Future<Map<String, dynamic>> callDeepLinkAPI(
    String url,
    Map<String, dynamic> data,
  ) async {
    final res = await http
        .post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(data),
        )
        .timeout(const Duration(seconds: 45));

    final respBody = json.decode(res.body) as Map<String, dynamic>;
    final error = respBody['errorCode'];

    if (error == 5) {
      throw KhqrResponse.error(ErrorCode.invalidDeepLinkSourceInfo);
    } else if (error == 4) {
      throw KhqrResponse.error(ErrorCode.internalServer);
    }

    return respBody;
  }

  /// Is Bakong Account Exist
  static Future<KhqrResponse<Map<String, dynamic>>> isBakongAccountExist(
    String url,
    String accountId,
  ) async {
    final res = await http
        .post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'accountId': accountId}),
        )
        .timeout(const Duration(seconds: 45));

    final respData = json.decode(res.body) as Map<String, dynamic>;
    final responseCode = respData['responseCode'];
    final error = respData['errorCode'];

    if (error == 11) {
      return KhqrResponse.success({'bakongAccountExisted': false});
    }
    if (error == 12) {
      return KhqrResponse.error(ErrorCode.bakongAccountIdInvalid);
    }

    if (responseCode == 0) {
      return KhqrResponse.success({'bakongAccountExisted': true});
    } else {
      return KhqrResponse.success({'bakongAccountExisted': false});
    }
  }
}
