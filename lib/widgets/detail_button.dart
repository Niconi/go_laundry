import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class DetailButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DetailButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: limeGreenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        'Lihat Detail',
        style: semiBoldText14.copyWith(color: whiteColor),
      ),
    );
  }
}
