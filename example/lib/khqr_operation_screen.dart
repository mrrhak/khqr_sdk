import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khqr_sdk/khqr_sdk.dart';

class KhqrOperationScreen extends StatefulWidget {
  const KhqrOperationScreen({super.key});

  @override
  State<KhqrOperationScreen> createState() => _KhqrOperationScreenState();
}

class _KhqrOperationScreenState extends State<KhqrOperationScreen> {
  late KhqrSdk _khqrSdk;

  @override
  void initState() {
    _khqrSdk = KhqrSdk();
    super.initState();
  }

  Future<void> generateIndividual() async {
    try {
      final info = IndividualInfo(
        bakongAccountId: 'john_smith@devb',
        merchantName: 'John Smith',
      );
      final individual = await _khqrSdk.generateIndividual(info);
      if (!mounted) return;
      if (individual != null) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: Text(individual.qr),
            actions: [
              TextButton(
                child: const Text('Copy'),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: individual.qr));
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to generate individual QR'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    } on PlatformException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.message ?? 'Failed to generate individual QR'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
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
      final merchant = await _khqrSdk.generateMerchant(info);
      if (!mounted) return;
      if (merchant != null) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: Text(merchant.qr),
            actions: [
              TextButton(
                child: const Text('Copy'),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: merchant.qr));
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to generate merchant QR'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    } on PlatformException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.message ?? 'Failed to generate merchant QR'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  Future<void> verify(String qrCode) async {
    try {
      final isValid = await _khqrSdk.verify(qrCode);
      if (!mounted) return;
      if (isValid) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('QR code is valid.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('QR code is invalid.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    } on PlatformException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.message ?? 'Verify failed'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  Future<void> decode(String qrCode) async {
    try {
      final khqrDecodeData = await _khqrSdk.decode(qrCode);
      if (!mounted) return;
      if (khqrDecodeData != null) {
        final prettyJson = const JsonEncoder.withIndent('  ').convert(
          khqrDecodeData.toJson(),
        );
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: Text(prettyJson),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to decode QR'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    } on PlatformException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.message ?? 'Failed to decode QR'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KHQR Operations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: generateIndividual,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.green),
              ),
              child: const Text(
                'Generate Individual QR',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: generateMerchant,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue),
              ),
              child: const Text(
                'Generate Merchant QR',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    final textController = TextEditingController();
                    return AlertDialog(
                      title: const Text('Verify QR'),
                      content: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          label: Text('Enter QR code'),
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Verify'),
                          onPressed: () async {
                            verify(textController.text);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.orange),
              ),
              child: const Text(
                'Verify QR',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    final textController = TextEditingController();
                    return AlertDialog(
                      title: const Text('Decode QR'),
                      content: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          label: Text('Enter QR code'),
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Decode'),
                          onPressed: () async {
                            decode(textController.text);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.teal),
              ),
              child: const Text(
                'Decode QR',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
