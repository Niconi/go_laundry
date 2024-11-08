import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class ServiceBox extends StatelessWidget {
  final String title;
  final String image;

  const ServiceBox({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: boldText14,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
