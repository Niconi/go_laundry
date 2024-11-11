import 'package:flutter/material.dart';
import 'package:go_laundry/appbar.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Top Up'),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Top Up'),
          ),
        ));
  }
}
