import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/success_icon.dart';

class ReceiptHeader extends StatelessWidget {
  const ReceiptHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const SuccessIcon(),
        const SizedBox(height: 16),
        Text('PEMBAYARAN TELAH BERHASIL!', style: boldText16),
        SizedBox(
          height: 4,
        ),
        Text('Pembayaran Anda telah berhasil dilakukan.', style: regularText14),
        const SizedBox(height: 10),
      ],
    );
  }
}
