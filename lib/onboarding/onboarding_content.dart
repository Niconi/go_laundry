import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 295,
            width: 295,
          ),
          SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              title,
              style: boldText28,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                description,
                style: mediumText14,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
