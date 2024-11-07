import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: borderColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/google-icon.png',
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 8),
          Text(
            "Masuk Dengan Google",
            style: semiBoldText14.copyWith(color: charcoalColor),
          ),
        ],
      ),
    );
  }
}
