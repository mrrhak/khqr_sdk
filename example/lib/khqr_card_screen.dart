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
  String? errorMessage;

  final String _receiverName = 'Kimhak';
  final KhqrCurrency _receiverCurrency = KhqrCurrency.khr;
  final double _amount = 0.00;

  @override
  void initState() {
    _khqrSdk = KhqrSdk();
    super.initState();

    generateIndividual();
  }

  Future<void> generateIndividual() async {
    try {
      final info = IndividualInfo(
        bakongAccountId: 'kimhak@dev',
        merchantName: _receiverName,
        accountInformation: '123456789',
        currency: _receiverCurrency,
        amount: _amount,
      );
      final individual = await _khqrSdk.generateIndividual(info);
      setState(() {
        khqrContent = individual?.qr;
      });
    } on PlatformException catch (e) {
      log('Error: ${e.message}');
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('KHQR Card'),
      ),
      body: errorMessage != null
          ? Center(
              child: Text(
              errorMessage!,
              style: TextStyle(color: Colors.red),
            ))
          : khqrContent == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    KhqrCardWidget(
                      width: 300.0,
                      receiverName: _receiverName,
                      amount: _amount,
                      keepIntegerDecimal: false,
                      currency: _receiverCurrency,
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
