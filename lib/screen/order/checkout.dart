import 'package:flutter/material.dart';
import 'package:go_laundry/appbar.dart';
import 'package:go_laundry/themes.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(title: 'Checkout'),
      body: Center(
        child: Text('Checkout Screen'),
      ),
    );
  }
}
