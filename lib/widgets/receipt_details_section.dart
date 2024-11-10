import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../models/receipt_model.dart';

class ReceiptDetailsSection extends StatelessWidget {
  final ReceiptModel receipt;

  const ReceiptDetailsSection({Key? key, required this.receipt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _buildSuccessMessage(),
          const SizedBox(height: 16),
          _buildTotalPayment(),
          const SizedBox(height: 40),
          _buildDetails(),
        ],
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Column(
      children: [
        Divider(
          color: borderColor,
          thickness: 1.0,
        ),
      ],
    );
  }

  Widget _buildTotalPayment() {
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 2,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Total Pembayaran',
          style: GoogleFonts.roboto(
              color: charcoalColor, fontSize: 14, fontWeight: regular),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          currencyFormat.format(receipt.totalPayment),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDetails() {
    return Column(
      children: [
        _buildDetailRow('Nomor Ref', receipt.referenceNumber),
        const SizedBox(height: 12),
        _buildDetailRow(
          'Waktu Pembayaran',
          DateFormat('dd MMM yyyy, HH:mm').format(receipt.paymentTime),
        ),
        const SizedBox(height: 12),
        _buildDetailRow('Metode Pembayaran', receipt.paymentMethod),
        const SizedBox(height: 12),
        _buildDetailRow('Tipe Cucian', receipt.washType),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: regularText12.copyWith(color: grayColor),
        ),
        Text(
          value,
          style: mediumText12.copyWith(color: blackColor),
        ),
      ],
    );
  }
}
