import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class CircleLoadingIndicator extends StatelessWidget {
  final double size;
  final Color color;

  const CircleLoadingIndicator({
    super.key,
    this.size = 50.0,
    this.color = blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.4),
        ),
        Center(
          child: Container(
            width: size + 30,
            height: size + 30,
            decoration: BoxDecoration(
              color: blackColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(color),
                strokeWidth: 3.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
