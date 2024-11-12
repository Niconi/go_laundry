import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';
import '../models/transaction_model.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionItem> transactions;

  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  String _formatDate(DateTime date) {
    final months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0 ||
                transactions[index].date != transactions[index - 1].date)
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatDate(transaction.date),
                      style: semiBoldText12.copyWith(color: blackColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFEEEEEE),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      transaction.serviceIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      transaction.serviceChoice,
                      style: regularText12,
                    ),
                  ),
                  Text(
                    'Rp ${transaction.amount.toStringAsFixed(0)}',
                    style: mediumText12.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
