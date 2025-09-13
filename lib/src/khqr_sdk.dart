import 'constant/emv.dart';
import 'constant/error_code.dart';
import 'core/decode_khqr.dart';
import 'core/generate_khqr.dart';
import 'enum/merchant_type.dart';
import 'helper/crc16.dart';
import 'helper/helper.dart';
import 'model/crc_validation.dart';
import 'model/decode_qr_data.dart';
import 'model/individual_info.dart';
import 'model/khqr_data.dart';
import 'model/khqr_deep_link_data.dart';
import 'model/khqr_response.dart';
import 'model/merchant_info.dart';
import 'model/source_info.dart';

/// KhqrSdk is a class that provides methods to generate and decode KHQR.
class KhqrSdk {
  /// Generate KHQR for individual.
  ///
  /// [individualInfo] is the information of the individual.
  ///
  /// Returns a [KhqrResponse] with the generated KHQR.
  ///
  /// If the generation fails, returns a [KhqrResponse] with an error code.
  ///
  /// Example:
  /// ```dart
  /// final info = IndividualInfo(
  ///   bakongAccountId: 'kimhak@dev',
  ///   merchantName: 'Kimhak',
  ///   merchantCity: 'Phnom Penh',
  ///   currency: KhqrCurrency.khr,
  /// );
  ///
  /// final res = KhqrSdk.generateIndividual(info);
  /// print(res.data?.toString());
  /// ```
  static KhqrResponse<KhqrData> generateIndividual(
    IndividualInfo individualInfo,
  ) {
    try {
      final khqr = GenerateKHQR.generate(
        individualInfo,
        MerchantType.individual.name,
      );

      if (khqr is KhqrResponse) {
        return khqr as KhqrResponse<KhqrData>;
      }

      final result = KhqrData(khqr as String);
      return KhqrResponse.success(result);
    } catch (e) {
      if (e is KhqrResponse) {
        return e as KhqrResponse<KhqrData>;
      }
      return KhqrResponse.error(ErrorCode.khqrInvalid);
    }
  }

  /// Generate KHQR for merchant.
  ///
  /// [merchantInfo] is the information of the merchant.
  ///
  /// Returns a [KhqrResponse] with the generated KHQR.
  ///
  /// If the generation fails, returns a [KhqrResponse] with an error code.
  ///
  /// Example:
  /// ```dart
  /// final info = MerchantInfo(
  ///   bakongAccountId: 'kimhak@dev',
  ///   merchantName: 'Kimhak',
  ///   merchantCity: 'Phnom Penh',
  ///   acquiringBank: 'Dev Bank',
  ///   merchantId: '123456',
  ///   currency: KhqrCurrency.khr,
  /// );
  ///
  /// final res = KhqrSdk.generateMerchant(info);
  /// print(res.data?.toString());
  /// ```
  static KhqrResponse<KhqrData> generateMerchant(MerchantInfo merchantInfo) {
    try {
      final khqr = GenerateKHQR.generate(
        merchantInfo,
        MerchantType.merchant.name,
      );

      if (khqr is KhqrResponse) {
        return khqr as KhqrResponse<KhqrData>;
      }

      final result = KhqrData(khqr as String);
      return KhqrResponse.success(result);
    } catch (e) {
      if (e is KhqrResponse) {
        return e as KhqrResponse<KhqrData>;
      }
      return KhqrResponse.error(ErrorCode.khqrInvalid);
    }
  }

  /// Decode KHQR.
  ///
  /// [khqrString] is the KHQR string to decode.
  ///
  /// Returns a [KhqrResponse] with the decoded data.
  ///
  /// If the decoding fails, returns a [KhqrResponse] with an error code.
  ///
  /// Example:
  /// ```dart
  /// final khqrString = '00020101021129270010kimhak@dev01091234567895204599953031165802KH5906Kimhak6010Phnom Penh63042592';
  /// final res = KhqrSdk.decode(khqrString);
  /// print(res.data?.toString());
  /// ```

  static KhqrResponse<DecodeQrData> decode(String khqrString) {
    try {
      final decodedData = DecodeKhqr.decode(khqrString);
      return KhqrResponse.success(decodedData);
    } catch (e) {
      if (e is KhqrResponse) {
        return e as KhqrResponse<DecodeQrData>;
      }
      return KhqrResponse.error(ErrorCode.khqrInvalid);
    }
  }

  /// Decode non-KHQR (Generic QR codes).
  ///
  /// [qrString] is the non-KHQR string to decode.
  ///
  /// Returns a [KhqrResponse] with the decoded data.
  ///
  /// If the decoding fails, returns a [KhqrResponse] with an error code.
  ///
  /// Example:
  /// ```dart
  /// final qrString = '00020101021129270010kimhak@dev01091234567895204599953031165802KH5906Kimhak6010Phnom Penh63042592';
  /// final res = KhqrSdk.decodeNonKhqr(qrString);
  /// print(res.data?.toString());
  /// ```
  static KhqrResponse<Map<String, dynamic>> decodeNonKhqr(String qrString) {
    try {
      final decodedData = DecodeKhqr.decodeNonKhqr(qrString);
      return KhqrResponse.success(decodedData);
    } catch (e) {
      return KhqrResponse.error(ErrorCode.khqrInvalid);
    }
  }

  /// Verify KHQR.
  ///
  /// [khqrString] is the KHQR string to verify.
  ///
  /// Returns a [CrcValidation] with the verification result.
  ///
  /// If the verification fails, returns a [CrcValidation] with [isValid] as false.
  ///
  /// Example:
  /// ```dart
  /// final khqrString = '00020101021129270010kimhak@dev01091234567895204599953031165802KH5906Kimhak6010Phnom Penh63042592';
  /// final res = KhqrSdk.verify(khqrString);
  /// print(res.isValid);
  /// ```
  static CrcValidation verify(String khqrString) {
    final isCorrectFormCRC = Helper.checkCrcRegExp(khqrString);
    if (!isCorrectFormCRC) return CrcValidation(false);

    final crc = khqrString.substring(khqrString.length - 4);
    final khqrNoCrc = khqrString.substring(0, khqrString.length - 4);
    final isValidCRC = Crc16.calculate(khqrNoCrc) == crc.toUpperCase();
    if (!isValidCRC) return CrcValidation(false);

    try {
      DecodeKhqr.decodeValidation(khqrString);
      return CrcValidation(true);
    } catch (e) {
      return CrcValidation(false);
    }
  }

  /// Generate deep link.
  ///
  /// [url] is the deep link URL.
  ///
  /// [qr] is the KHQR string.
  ///
  /// [sourceInfo] is the source information.
  ///
  /// Returns a [KhqrResponse] with the generated deep link.
  ///
  /// If the generation fails, returns a [KhqrResponse] with an error code.
  ///
  /// Example:
  /// ```dart
  /// final url = 'https://api.example.com/v1/generate_deeplink_by_qr';
  /// final qr = '00020101021129270010kimhak@dev01091234567895204599953031165802KH5906Kimhak6010Phnom Penh63042592';
  /// final res = await KhqrSdk.generateDeepLink(url, qr);
  /// print(res.data?.toString());
  /// ```
  static Future<KhqrResponse<KhqrDeepLinkData>> generateDeepLink(
    String url,
    String qr, [
    SourceInfo? sourceInfo,
  ]) async {
    // Check invalid URL
    if (!Helper.isValidUrl(url)) {
      return KhqrResponse.error(ErrorCode.invalidDeepLinkUrl);
    }

    // Check QR is valid (CRC)
    final isValidKHQR = verify(qr);
    if (!isValidKHQR.isValid) {
      return KhqrResponse.error(ErrorCode.khqrInvalid);
    }

    // Check data source field
    if (sourceInfo != null) {
      if (sourceInfo.appIconUrl == null ||
          sourceInfo.appName == null ||
          sourceInfo.appDeepLinkCallback == null) {
        return KhqrResponse.error(ErrorCode.invalidDeepLinkSourceInfo);
      }
    }

    try {
      final data = await Helper.callDeepLinkAPI(url, {'qr': qr});
      final deepLinkData = KhqrDeepLinkData(data['data']['shortLink']);
      return KhqrResponse.success(deepLinkData);
    } catch (e) {
      return KhqrResponse.error(ErrorCode.connectionTimeout);
    }
  }

  /// Check if Bakong account exists.
  ///
  /// [url] is the API URL.
  ///
  /// [bakongAccount] is the Bakong account to check.
  ///
  /// Returns a [KhqrResponse] with the check result.
  ///
  /// If the check fails, returns a [KhqrResponse] with an error code.
  ///
  /// Example:
  /// ```dart
  /// final url = 'https://api-bakong.nbc.gov.kh/v1/check_account_by_id';
  /// final bakongAccount = 'kimhak@dev';
  /// final res = await KhqrSdk.checkBakongAccount(url, bakongAccount);
  /// print(res.data?.toString());
  /// ```
  static Future<KhqrResponse<Map<String, dynamic>>> checkBakongAccount(
    String url,
    String bakongAccount,
  ) async {
    try {
      if (bakongAccount.length > EMV.invalidLength['bakongAccount']!) {
        return KhqrResponse.error(ErrorCode.bakongAccountIdLengthInvalid);
      }

      if (bakongAccount.split('@').length != 2) {
        return KhqrResponse.error(ErrorCode.bakongAccountIdInvalid);
      }

      return await Helper.isBakongAccountExist(url, bakongAccount);
    } catch (e) {
      return KhqrResponse.error(ErrorCode.connectionTimeout);
    }
  }
}
