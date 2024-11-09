import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class PinPad extends StatelessWidget {
  final int pinLength;
  final String currentPin;
  final void Function(String) onNumberPressed;
  final VoidCallback onBackspacePressed;

  const PinPad({
    super.key,
    required this.pinLength,
    required this.currentPin,
    required this.onNumberPressed,
    required this.onBackspacePressed,
  });

  Widget _buildPinDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pinLength,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Icon(
            Icons.circle,
            color: index < currentPin.length ? blackColor : grayColor,
            size: 16.0,
          ),
        ),
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return InkWell(
      onTap: () => onNumberPressed(number),
      borderRadius: BorderRadius.circular(10),
      splashColor: transparentColor,
      highlightColor: transparentColor,
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        child: Text(
          number,
          style: regularText24,
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return InkWell(
      onTap: onBackspacePressed,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        child: Icon(Icons.backspace, color: blackColor, size: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPinDisplay(),
        SizedBox(height: 40),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNumberButton('1'),
                _buildNumberButton('2'),
                _buildNumberButton('3'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNumberButton('4'),
                _buildNumberButton('5'),
                _buildNumberButton('6'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNumberButton('7'),
                _buildNumberButton('8'),
                _buildNumberButton('9'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 100),
                _buildNumberButton('0'),
                _buildBackspaceButton(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
