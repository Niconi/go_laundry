import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(BuildContext context, String message,
      {Color backgroundColor = Colors.black, Color textColor = Colors.white}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.down,
        animation: _slideOutAnimation(),
      ),
    );
  }

  static Animation<double> _slideOutAnimation() {
    return Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: AlwaysStoppedAnimation(1.0),
        curve: Curves.easeOutBack,
      ),
    );
  }
}
