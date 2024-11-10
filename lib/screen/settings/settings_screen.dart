import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}
