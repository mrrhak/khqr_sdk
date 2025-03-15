import 'package:flutter/material.dart';
import 'package:khqr_sdk_example/khqr_card_screen.dart';
import 'package:khqr_sdk_example/khqr_operation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KHQR Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KhqrOperationScreen(),
                  ),
                );
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.indigo),
              ),
              child: const Text(
                'Test KHQR Operations',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KhqrCardScreen(),
                  ),
                );
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.pink),
              ),
              child: const Text(
                'View KHQR Card',
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
