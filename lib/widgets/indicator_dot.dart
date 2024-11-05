import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class IndicatorDot extends StatelessWidget {
  final bool isActive;

  const IndicatorDot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: isActive ? 20 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: isActive ? limeGreenColor : lightGrayColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
