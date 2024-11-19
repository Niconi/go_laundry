import 'package:flutter/material.dart';
import 'package:go_laundry/router/slide_page_router.dart';
import 'package:go_laundry/screen/order/receipt_screen.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/pin_pad.dart';

class InputPin extends StatefulWidget {
  const InputPin({super.key});

  @override
  _InputPinState createState() => _InputPinState();
}

class _InputPinState extends State<InputPin> {
  final int _pinLength = 4;
  String _currentPin = "";

  void _onNumberPressed(String number) {
    if (_currentPin.length < _pinLength) {
      setState(() {
        _currentPin += number;
      });
      if (_currentPin.length == _pinLength) {
        Navigator.push(
          context,
          SlidePageRoute(page: ReceiptScreen()),
        );
      }
    }
  }

  void _onBackspacePressed() {
    if (_currentPin.isNotEmpty) {
      setState(() {
        _currentPin = _currentPin.substring(0, _currentPin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Masukkan PIN Anda',
              style: regularText20,
            ),
            SizedBox(height: screenHeight * 0.05),
            PinPad(
              pinLength: _pinLength,
              currentPin: _currentPin,
              onNumberPressed: _onNumberPressed,
              onBackspacePressed: _onBackspacePressed,
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
