import 'dart:ui';

class WalletButtonModel {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  WalletButtonModel({
    required this.title,
    required this.iconPath,
    required this.onTap,
  });
}
