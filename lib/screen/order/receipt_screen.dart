// lib/screens/receipt_screen.dart

import 'package:flutter/material.dart';
import 'package:go_laundry/models/receipt_model.dart';
import 'package:go_laundry/widgets/receipt_card.dart';

class ReceiptScreen extends StatelessWidget {
  final ReceiptModel? receipt; // Buat nullable

  const ReceiptScreen({Key? key, this.receipt})
      : super(key: key); // Hapus required

  @override
  Widget build(BuildContext context) {
    // Buat receipt default jika null
    final ReceiptModel receiptData = receipt ??
        ReceiptModel(
          totalPayment: 10000.00,
          referenceNumber: '000085752257',
          paymentTime: DateTime.now(),
          paymentMethod: 'Tabungan',
          washType: 'Cuci Lipat',
        );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: ReceiptCard(receipt: receiptData),
      ),
    );
  }
}
