import 'package:flutter/material.dart';

class ReceiptCloseButton extends StatelessWidget {
  const ReceiptCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}