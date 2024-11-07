import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final Icon? icon;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: regularText14),
        const SizedBox(height: 2),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: regularText14.copyWith(color: silverGrayColor),
            filled: true,
            fillColor: lightGrayColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            prefixIcon: icon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                    child: icon,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
