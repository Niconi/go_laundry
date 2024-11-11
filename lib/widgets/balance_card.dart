import 'package:flutter/material.dart';
import '../themes.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  final double maxHeight;

  const BalanceCard({
    Key? key,
    required this.balance,
    required this.maxHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxHeight * 0.70,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Card(
        elevation: 4,
        color: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'DANA ANDA',
                style: boldText16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Rp ${balance.toStringAsFixed(0)}',
                style: boldText28,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Column(
                // Changed from Row to Column for vertical layout
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icons/top-up.png',
                      width: 28,
                      height: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8), // Space between icon and text
                  Text('Top-up',
                      style: mediumText14.copyWith(color: grayColor)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
