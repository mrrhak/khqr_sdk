import 'package:flutter_test/flutter_test.dart';
import 'package:khqr_sdk/khqr_sdk.dart';
import 'package:khqr_sdk/src/enum/merchant_type.dart';

void main() {
  final bakongAccountId = 'test@dev';
  final merchantName = 'Test Merchant';
  final acquiringBank = 'Dev Bank';
  final merchantId = '123456';

  test('generate individual qr code', () {
    final info = IndividualInfo(
      bakongAccountId: bakongAccountId,
      merchantName: merchantName,
    );
    final res = KhqrSdk.generateIndividual(info);
    expect(res.data, isNotNull);
    expect(res.data!.qr, isA<String>());
    expect(res.data!.md5Hash, isA<String>());
  });

  test('generate merchant qr code', () {
    final info = MerchantInfo(
      bakongAccountId: bakongAccountId,
      acquiringBank: acquiringBank,
      merchantId: merchantId,
      merchantName: merchantName,
    );
    final res = KhqrSdk.generateMerchant(info);
    expect(res.data, isNotNull);
    expect(res.data!.qr, isA<String>());
    expect(res.data!.md5Hash, isA<String>());
  });

  test('verify individual qr code', () {
    final qrString =
        '00020101021129120008test@dev5204599953031165802KH5913Test Merchant6010Phnom Penh63048C7E';
    final validation = KhqrSdk.verify(qrString);
    expect(validation.isValid, isTrue);
  });

  test('verify merchant qr code', () {
    final qrString =
        '00020101021130340008test@dev01061234560208Dev Bank5204599953031165802KH5913Test Merchant6010Phnom Penh6304BCB9';
    final validation = KhqrSdk.verify(qrString);
    expect(validation.isValid, isTrue);
  });

  test('decode individual qr code', () {
    final qrString =
        '00020101021129120008test@dev5204599953031165802KH5913Test Merchant6010Phnom Penh63048C7E';
    final res = KhqrSdk.decode(qrString);
    expect(res.data, isNotNull);
    expect(res.data!.merchantType, MerchantType.individual.tag);
    expect(res.data!.bakongAccountID, bakongAccountId);
    expect(res.data!.merchantName, merchantName);
    expect(res.data!.accountInformation, isNull);
    expect(res.data!.merchantID, isNull);
    expect(res.data!.acquiringBank, isNull);
    expect(res.data!.billNumber, isNull);
    expect(res.data!.mobileNumber, isNull);
    expect(res.data!.storeLabel, isNull);
    expect(res.data!.terminalLabel, isNull);
    expect(res.data!.purposeOfTransaction, isNull);
    expect(res.data!.languagePreference, isNull);
    expect(res.data!.merchantNameAlternateLanguage, isNull);
    expect(res.data!.merchantCityAlternateLanguage, isNull);
    expect(res.data!.creationTimestamp, isNull);
    expect(res.data!.expirationTimestamp, isNull);
    expect(res.data!.payloadFormatIndicator, isNotNull);
    expect(res.data!.pointOfInitiationMethod, isNotNull);
    expect(res.data!.unionPayMerchant, isNull);
    expect(res.data!.merchantCategoryCode, isNotNull);
    expect(res.data!.transactionCurrency, isNotNull);
    expect(res.data!.transactionAmount, isNull);
    expect(res.data!.countryCode, isNotNull);
    expect(res.data!.crc, isNotNull);
  });

  test('decode merchant qr code', () {
    final qrString =
        '00020101021130340008test@dev01061234560208Dev Bank5204599953031165802KH5913Test Merchant6010Phnom Penh6304BCB9';
    final res = KhqrSdk.decode(qrString);
    expect(res.data, isNotNull);
    expect(res.data!.merchantType, MerchantType.merchant.tag);
    expect(res.data!.bakongAccountID, bakongAccountId);
    expect(res.data!.merchantName, merchantName);
    expect(res.data!.accountInformation, isNull);
    expect(res.data!.merchantID, merchantId);
    expect(res.data!.acquiringBank, acquiringBank);
    expect(res.data!.billNumber, isNull);
    expect(res.data!.mobileNumber, isNull);
    expect(res.data!.storeLabel, isNull);
    expect(res.data!.terminalLabel, isNull);
    expect(res.data!.purposeOfTransaction, isNull);
    expect(res.data!.languagePreference, isNull);
    expect(res.data!.merchantNameAlternateLanguage, isNull);
    expect(res.data!.merchantCityAlternateLanguage, isNull);
    expect(res.data!.creationTimestamp, isNull);
    expect(res.data!.expirationTimestamp, isNull);
    expect(res.data!.payloadFormatIndicator, isNotNull);
    expect(res.data!.pointOfInitiationMethod, isNotNull);
    expect(res.data!.unionPayMerchant, isNull);
    expect(res.data!.merchantCategoryCode, isNotNull);
    expect(res.data!.transactionCurrency, isNotNull);
    expect(res.data!.transactionAmount, isNull);
    expect(res.data!.countryCode, isNotNull);
    expect(res.data!.crc, isNotNull);
  });

  test('decode non khqr code', () {
    final qrString =
        '00020101021129120008test@dev5204599953031165802KH5913Test Merchant6010Phnom Penh63048C7E';
    final res = KhqrSdk.decodeNonKhqr(qrString);
    expect(res.data, isNotNull);
    expect(res.data, isMap);
  });
}
