import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class WalletButton extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const WalletButton({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: limeGreenColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                iconPath,
                width: 24,
                height: 24,
                color: whiteColor,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
