import 'package:flutter/material.dart';
import 'package:go_laundry/appbar.dart';
import 'package:go_laundry/models/transaction_model.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/balance_card.dart';
import 'package:go_laundry/widgets/transaction_list.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  // Sample data initialization
  TransactionModel get transactionData => TransactionModel(
        balance: 3000000,
        transactions: [
          TransactionItem(
            date: DateTime(2024, 10, 15),
            serviceIcon: 'assets/icons/kering.png',
            serviceChoice: 'CUCI LIPAT 5 KG',
            amount: 40000,
          ),
          TransactionItem(
            date: DateTime(2024, 10, 28),
            serviceIcon: 'assets/icons/kering.png',
            serviceChoice: 'CUCI SETRIKA 5 KG',
            amount: 50000,
          ),
          TransactionItem(
            date: DateTime(2024, 11, 2),
            serviceIcon: 'assets/icons/kering.png',
            serviceChoice: 'CUCI SEPATU 5 KG',
            amount: 90000,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final panelMinHeight = height * 0.6;
    final panelMaxHeight = height * 0.85;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(title: 'Transaksi'),
      body: Stack(
        children: [
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: BalanceCard(
              balance: transactionData.balance,
              maxHeight: height - panelMinHeight,
            ),
          ),
          // Sliding Panel
          SlidingUpPanel(
            minHeight: panelMinHeight,
            maxHeight: panelMaxHeight,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            panel: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Semua Transaksi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: TransactionList(
                        transactions: transactionData.transactions,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: const SizedBox.shrink(), // Empty body since we're using Stack
          ),
        ],
      ),
    );
  }
}
