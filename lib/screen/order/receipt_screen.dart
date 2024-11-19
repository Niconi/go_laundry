import 'package:flutter/material.dart';
import 'package:go_laundry/models/receipt_model.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/receipt_card.dart';

class ReceiptScreen extends StatelessWidget {
  final ReceiptModel? receipt;

  const ReceiptScreen({Key? key, this.receipt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReceiptModel receiptData = receipt ??
        ReceiptModel(
          totalPayment: 10000.00,
          referenceNumber: '000085752257',
          paymentTime: DateTime.now(),
          paymentMethod: 'Tabungan',
          washType: 'Cuci Lipat',
        );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: ReceiptCard(receipt: receiptData),
      ),
    );
  }
}
