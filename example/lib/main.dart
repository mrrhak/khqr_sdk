import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:khqr_sdk/khqr_sdk.dart';
import 'package:khqr_sdk/model/deeplink_info/deeplink_info.dart';
import 'package:khqr_sdk/model/individual_info/individual_info.dart';
import 'package:khqr_sdk/model/merchant_info/merchant_info.dart';
import 'package:khqr_sdk/model/source_info/source_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _khqrSdkPlugin = KhqrSdk();

  Future<void> generateIndividual() async {
    try {
      final info = IndividualInfo(
        bakongAccountId: 'john_smith@devb',
        merchantName: 'John Smith',
      );
      final individual = await _khqrSdkPlugin.generateIndividual(info);
      log(individual.toString());
    } on PlatformException catch (e) {
      log('Error: ${e.message}');
    }
  }

  Future<void> generateMerchant() async {
    try {
      final info = MerchantInfo(
        bakongAccountId: 'john_smith@devb',
        acquiringBank: 'Dev Bank',
        merchantId: '123456',
        merchantName: 'John Smith',
      );
      final merchant = await _khqrSdkPlugin.generateMerchant(info);
      log(merchant.toString());
    } on PlatformException catch (e) {
      log('Error: ${e.message}');
    }
  }

  Future<void> verify() async {
    try {
      const qrCode =
          "00020101021129190015john_smith@devb5204599953031165802KH5910John Smith6010Phnom Penh991700131727168754698630499FB";
      final isValid = await _khqrSdkPlugin.verify(qrCode);
      log('isValid: $isValid');
    } on PlatformException catch (e) {
      log('Error: ${e.message}');
    }
  }

  Future<void> decode() async {
    try {
      const qrCode =
          "00020101021129190015john_smith@devb5204599953031165802KH5910John Smith6010Phnom Penh991700131727168754698630499FB";
      final khqrDecodeData = await _khqrSdkPlugin.decode(qrCode);
      log('khqrDecodeData: ${khqrDecodeData.toString()}');
    } on PlatformException catch (e) {
      log('Error: ${e.message}');
    }
  }

  Future<void> generateDeeplink() async {
    try {
      final sourceInfo = SourceInfo(
        appName: 'Example App',
        appIconUrl: 'http://cdn.example.com/icons.logo.png',
        appDeepLinkCallBack: 'http://app.example.com',
      );

      final deeplinkInfo = DeeplinkInfo(
        qr: "00020101021129190015john_smith@devb5204599953031165802KH5910John Smith6010Phnom Penh991700131727168754698630499FB",
        url: 'http://api.example.com/v1/generate_deeplink_by_qr',
        sourceInfo: sourceInfo,
      );

      final deeplinkData = await _khqrSdkPlugin.generateDeepLink(deeplinkInfo);
      log('deeplinkData: ${deeplinkData.toString()}');
    } on PlatformException catch (e) {
      log('Error: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: generateIndividual,
                child: const Text('Generate Individual'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: generateMerchant,
                child: const Text('Generate Merchant'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: verify,
                child: const Text('Verify'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: decode,
                child: const Text('Decode'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: generateDeeplink,
                child: const Text('Generate Deeplink'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
