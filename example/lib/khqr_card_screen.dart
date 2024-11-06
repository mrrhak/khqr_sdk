import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khqr_sdk/khqr_sdk.dart';

class KhqrCardScreen extends StatefulWidget {
  const KhqrCardScreen({super.key});

  @override
  State<KhqrCardScreen> createState() => _KhqrCardScreenState();
}

class _KhqrCardScreenState extends State<KhqrCardScreen> {
  late KhqrSdk _khqrSdk;
  String? khqrContent;

  @override
  void initState() {
    _khqrSdk = KhqrSdk();
    super.initState();

    generateIndividual();
  }

  Future<void> generateIndividual() async {
    try {
      final info = IndividualInfo(
        bakongAccountId: 'john_smith@devb',
        merchantName: 'John Smith',
        currency: KhqrCurrency.khr,
        amount: 0,
      );
      final individual = await _khqrSdk.generateIndividual(info);
      setState(() {
        khqrContent = individual?.qr;
      });
    } on PlatformException catch (e) {
      log('Error: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('KHQR Card'),
      ),
      body: khqrContent == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                KhqrCardWidget(
                  width: 300.0,
                  receiverName: 'John Smith',
                  amount: 0,
                  currency: KhqrCurrency.khr,
                  qr: khqrContent!,
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(khqrContent!),
                ),
              ],
            ),
    );
  }
}
