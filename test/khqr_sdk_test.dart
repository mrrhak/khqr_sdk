import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:khqr_sdk/khqr_sdk.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  KhqrSdk khqrSdk = KhqrSdk();
  const MethodChannel channel = MethodChannel('khqr_sdk');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          if (methodCall.method == 'generateIndividual') {
            final khqrData = KhqrData(
              qr: 'This is individual QR',
              md5: 'This is individual MD5',
            );
            return jsonEncode(khqrData);
          } else if (methodCall.method == 'generateMerchant') {
            final khqrData = KhqrData(
              qr: 'This is merchant QR',
              md5: 'This is merchant MD5',
            );
            return jsonEncode(khqrData);
          } else if (methodCall.method == 'verify') {
            return true;
          } else if (methodCall.method == 'decode') {
            final decodeData = KhqrDecodedData(
              bakongAccountId: 'kimhak@dev',
              merchantName: 'Kimhak',
            );
            return jsonEncode(decodeData);
          }
          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('generateIndividual', () async {
    final info = IndividualInfo(
      bakongAccountId: 'kimhak@dev',
      merchantName: 'Kimhak',
      accountInformation: '123456789',
      currency: KhqrCurrency.khr,
      amount: 0,
    );
    final khqrData = await khqrSdk.generateIndividual(info);
    expect(khqrData, isNotNull);
    expect(khqrData?.qr, 'This is individual QR');
  });

  test('generateMerchant', () async {
    final info = MerchantInfo(
      bakongAccountId: 'kimhak@dev',
      merchantName: 'Kimhak',
      acquiringBank: 'Dev Bank',
      merchantId: '123456',
      currency: KhqrCurrency.khr,
      amount: 0,
    );
    final khqrData = await khqrSdk.generateMerchant(info);
    expect(khqrData, isNotNull);
    expect(khqrData?.qr, 'This is merchant QR');
  });

  test('verify', () async {
    final isVerify = await khqrSdk.verify('Test');
    expect(isVerify, true);
  });

  test('decode', () async {
    final decoded = await khqrSdk.decode('Test');
    expect(decoded, isNotNull);
    expect(decoded?.bakongAccountId, 'kimhak@dev');
  });
}
