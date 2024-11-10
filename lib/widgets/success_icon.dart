import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        color: limeGreenColor,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 32,
      ),
    );
  }
}
