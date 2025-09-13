import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khqr_sdk/khqr_sdk.dart';

class KhqrOperationScreen extends StatelessWidget {
  const KhqrOperationScreen({super.key});

  void _generateIndividual(BuildContext context) {
    try {
      final info = IndividualInfo(
        bakongAccountId: 'kimhak@dev',
        merchantName: 'Kimhak',
        accountInformation: '123456789',
        currency: KhqrCurrency.khr,
        amount: 0,
      );
      final res = KhqrSdk.generateIndividual(info);
      if (res.data != null) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: Text(res.data!.qr),
            actions: [
              TextButton(
                child: const Text('Copy'),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: res.data!.qr));
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

  void _generateMerchant(BuildContext context) {
    try {
      // Dynamic QR with amount required to set expiration
      // 1 hour from now
      final expire = DateTime.now().millisecondsSinceEpoch + 3600000;

      final info = MerchantInfo(
        bakongAccountId: 'kimhak@dev',
        acquiringBank: 'Dev Bank',
        merchantId: '123456',
        merchantName: 'Kimhak',
        currency: KhqrCurrency.usd,
        amount: 100.0,
        expirationTimestamp: expire,
      );
      final res = KhqrSdk.generateMerchant(info);
      if (res.data != null) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: Text(res.data!.qr),
            actions: [
              TextButton(
                child: const Text('Copy'),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: res.data!.qr));
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

  void _verify(BuildContext context, String qrCode) {
    try {
      final res = KhqrSdk.verify(qrCode);
      if (res.isValid) {
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

  void _decode(BuildContext context, String qrCode) {
    try {
      final res = KhqrSdk.decode(qrCode);
      if (res.data != null) {
        final prettyJson = const JsonEncoder.withIndent(
          '  ',
        ).convert(res.data!.toMap());
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: Text(prettyJson, style: TextStyle(fontSize: 12.0)),
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

  void _decodeNonKhqr(BuildContext context, String qrCode) {
    try {
      final res = KhqrSdk.decodeNonKhqr(qrCode);
      if (res.data != null) {
        final prettyJson = const JsonEncoder.withIndent('  ').convert(res.data);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: Text(prettyJson, style: TextStyle(fontSize: 12.0)),
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
            content: const Text('Failed to decode Non KHQR'),
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
          content: Text(e.message ?? 'Failed to decode Non KHQR'),
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
      appBar: AppBar(title: const Text('KHQR Operations')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _generateIndividual(context),
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
              onPressed: () => _generateMerchant(context),
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
                            Navigator.of(context).pop();
                            _verify(context, textController.text);
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
                            Navigator.of(context).pop();
                            _decode(context, textController.text);
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
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    final textController = TextEditingController();
                    return AlertDialog(
                      title: const Text('Decode Non KHQR'),
                      content: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          label: Text('Enter Non KHQR code'),
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Decode'),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            _decodeNonKhqr(context, textController.text);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.pink),
              ),
              child: const Text(
                'Decode Non KHQR',
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
