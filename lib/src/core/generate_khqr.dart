import '../constant/emv.dart';
import '../constant/error_code.dart';
import '../enum/khqr_currency.dart';
import '../helper/crc16.dart';
import '../merchant_code/additional_data.dart';
import '../merchant_code/country_code.dart';
import '../merchant_code/global_unique_identifier.dart';
import '../merchant_code/merchant_category_code.dart';
import '../merchant_code/merchant_city.dart';
import '../merchant_code/merchant_information_language_template.dart';
import '../merchant_code/merchant_name.dart';
import '../merchant_code/payload_format_indicator.dart';
import '../merchant_code/point_of_initiation_method.dart';
import '../merchant_code/time_stamp.dart';
import '../merchant_code/transaction_amount.dart';
import '../merchant_code/transaction_currency.dart';
import '../merchant_code/union_pay_merchant.dart';
import '../model/individual_info.dart';
import '../model/khqr_response.dart';
import '../model/merchant_info.dart';

/// Generate KHQR Class
class GenerateKHQR {
  /// Generate KHQR Method
  ///
  /// [information] is the information of the individual or merchant.
  ///
  /// [type] is the type of the information.
  ///
  /// Returns a [KhqrResponse] with the generated KHQR.
  ///
  /// If the generation fails, returns a [KhqrResponse] with an error code.
  static dynamic generate(dynamic information, String type) {
    try {
      final infoMap = information is IndividualInfo
          ? information.toMap()
          : information is MerchantInfo
          ? information.toMap()
          : information as Map<String, dynamic>;

      // Create merchant info
      Map<String, dynamic> merchantInfo = {
        'bakongAccountID': infoMap['bakongAccountId'],
        'isMerchant': type == 'merchant',
      };

      if (type == 'merchant') {
        merchantInfo.addAll({
          'merchantID': infoMap['merchantId'],
          'acquiringBank': infoMap['acquiringBank'],
        });
      } else {
        merchantInfo.addAll({
          'accountInformation': infoMap['accountInformation'],
          'acquiringBank': infoMap['acquiringBank'],
        });
      }

      final amount = infoMap['amount'];

      // Create each tag
      final payloadFormatIndicator = PayloadFormatIndicator(
        EMV.payloadFormatIndicator,
        EMV.defaultPayloadFormatIndicator,
      );

      // Determine QR type
      String qrType = EMV.dynamicQR;
      if (amount == null || amount == 0) {
        qrType = EMV.staticQR;
      }

      final pointOfInitiationMethod = PointOfInitiationMethod(
        EMV.pointOfInitiationMethod,
        qrType,
      );

      UnionPayMerchant? upi;
      if (infoMap['upiMerchantAccount'] != null) {
        upi = UnionPayMerchant(
          EMV.unionPayMerchantAccount,
          infoMap['upiMerchantAccount'],
        );
      }

      // Set tag for merchant account type
      String khqrType = EMV.merchantAccountInformationIndividual;
      if (type == 'merchant') {
        khqrType = EMV.merchantAccountInformationMerchant;
      }

      final globalUniqueIdentifier = GlobalUniqueIdentifier(
        khqrType,
        merchantInfo,
      );

      final merchantCategoryCode = MerchantCategoryCode(
        EMV.merchantCategoryCode,
        infoMap['merchantCategoryCode']?.toString() ??
            EMV.defaultMerchantCategoryCode,
      );

      final currency = TransactionCurrency(
        EMV.transactionCurrency,
        infoMap['currency'].toString(),
      );

      // Array of KHQR instances
      final List<dynamic> khqrInstances = [
        payloadFormatIndicator,
        pointOfInitiationMethod,
        globalUniqueIdentifier,
        merchantCategoryCode,
        currency,
      ];

      if (upi != null) {
        khqrInstances.add(upi);
      }

      // Add transaction amount if present
      if (amount != null && amount != 0) {
        dynamic amountInput = amount;

        if (infoMap['currency'] == KhqrCurrency.khr.value) {
          if (amountInput % 1 == 0) {
            amountInput = amountInput.round();
          } else {
            throw KhqrResponse.error(ErrorCode.transactionAmountInvalid);
          }
        } else {
          final amountSplit = amountInput.toString().split('.');
          final precision = amountSplit.length > 1 ? amountSplit[1] : null;

          if (precision != null && precision.length > 2) {
            throw KhqrResponse.error(ErrorCode.transactionAmountInvalid);
          }

          if (precision != null) {
            amountInput = double.parse(
              amountInput.toString(),
            ).toStringAsFixed(2);
          }
        }

        final transactionAmount = TransactionAmount(
          EMV.transactionAmount,
          amountInput.toString(),
        );
        khqrInstances.add(transactionAmount);
      }

      final countryCode = CountryCode(EMV.countryCode, EMV.defaultCountryCode);
      khqrInstances.add(countryCode);

      final merchantName = MerchantName(
        EMV.merchantName,
        infoMap['merchantName'],
      );
      khqrInstances.add(merchantName);

      final merchantCity = MerchantCity(
        EMV.merchantCity,
        infoMap['merchantCity'] ?? EMV.defaultMerchantCity,
      );
      khqrInstances.add(merchantCity);

      // Add additional data if present
      final additionalDataInfo = {
        'billNumber': infoMap['billNumber'],
        'mobileNumber': infoMap['mobileNumber'],
        'storeLabel': infoMap['storeLabel'],
        'terminalLabel': infoMap['terminalLabel'],
        'purposeOfTransaction': infoMap['purposeOfTransaction'],
      };

      final isEmptyAdditionalData = additionalDataInfo.values.every(
        (el) => el == null || el == '',
      );

      if (!isEmptyAdditionalData) {
        final additionalData = AdditionalData(
          EMV.additionalDataTag,
          additionalDataInfo,
        );
        khqrInstances.add(additionalData);
      }

      final languageInfo = {
        'languagePreference': infoMap['languagePreference'],
        'merchantNameAlternateLanguage':
            infoMap['merchantNameAlternateLanguage'],
        'merchantCityAlternateLanguage':
            infoMap['merchantCityAlternateLanguage'],
      };

      final isEmptyLanguageTemplate = languageInfo.values.every(
        (el) => el == null || el == '',
      );

      if (!isEmptyLanguageTemplate) {
        final languageTemplate = MerchantInformationLanguageTemplate(
          EMV.merchantInformationLanguageTemplate,
          languageInfo,
        );
        khqrInstances.add(languageTemplate);
      }

      if (qrType == EMV.dynamicQR && infoMap['expirationTimestamp'] != null) {
        final timeStamp = TimeStamp(EMV.timestampTag, {
          'creationTimestamp': DateTime.now().millisecondsSinceEpoch,
          'expirationTimestamp': infoMap['expirationTimestamp'],
        }, qrType);
        khqrInstances.add(timeStamp);
      }

      // Build KHQR string
      String khqrNoCrc = '';
      for (var instance in khqrInstances) {
        khqrNoCrc += instance.toString();
      }

      // Add CRC
      String khqr = khqrNoCrc + EMV.crc + EMV.crcLength;
      khqr += Crc16.calculate(khqr);

      return khqr;
    } catch (e) {
      return e;
    }
  }
}
