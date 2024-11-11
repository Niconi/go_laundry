import 'package:flutter/material.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Top Up'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Top Up'),
          ),
        ));
  }
}
