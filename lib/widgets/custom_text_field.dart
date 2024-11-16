import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final Icon? icon;
  final bool obscureText;
  final TextInputType inputType;
  final bool enabled;
  final int? maxLines;
  final Color borderColor;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.icon,
    this.obscureText = false,
    this.inputType = TextInputType.text,
    this.enabled = true,
    this.maxLines = 1,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 2),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: inputType,
          enabled: enabled,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide:
                  BorderSide(color: blackColor, width: 1.0), 
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: redColor), 
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: grayColor), 
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
