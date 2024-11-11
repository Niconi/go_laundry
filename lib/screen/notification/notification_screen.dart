import 'package:flutter/material.dart';
import 'package:go_laundry/appbar.dart';
import 'package:go_laundry/themes.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notifikasi'),
      backgroundColor: backgroundColor,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the next screen
          },
          child: const Text('Go to Notification Detail'),
        ),
      ),
    );
  }
}
