import 'package:flutter/material.dart';
import 'package:go_laundry/models/wallet_button_model.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/wallet_button.dart';

class Wallet extends StatelessWidget {
  final String balance;
  final String walletIconPath;
  final List<WalletButtonModel> buttons;

  const Wallet({
    Key? key,
    required this.balance,
    required this.walletIconPath,
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: limeGreenColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Image.asset(
                    walletIconPath,
                    width: 30,
                    height: 30,
                    color: whiteColor,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tabungan',
                    style: boldText14,
                  ),
                  Text(
                    balance,
                    style: boldText14,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: buttons
                .map((button) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: WalletButton(
                        title: button.title,
                        iconPath: button.iconPath,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
