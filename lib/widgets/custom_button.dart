import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final bool? isEnabled;

  const CustomButton(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed,
      this.textColor = offWhiteColor,
      this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: semiBoldText14.copyWith(color: whiteColor),
      ),
    );
  }
}
