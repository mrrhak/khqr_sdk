import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:khqr_sdk/khqr_sdk_method_channel.dart';
import 'package:khqr_sdk/model/individual_info/individual_info.dart';
import 'package:khqr_sdk/model/khqr_data/khqr_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelKhqrSdk platform = MethodChannelKhqrSdk();
  const MethodChannel channel = MethodChannel('khqr_sdk');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        if (methodCall.method == 'generateIndividual') {
          final khqrData = KhqrData(qr: 'This is QR', md5: 'This is MD5');
          return jsonEncode(khqrData);
        }
        return null;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('generateIndividual', () async {
    final info = IndividualInfo(
      bakongAccountId: 'john_smith@devb',
      merchantName: 'John Smith',
    );
    expect(await platform.generateIndividual(info), isNotNull);
  });
}
