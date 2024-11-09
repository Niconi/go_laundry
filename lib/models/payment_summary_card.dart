import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class PaymentSummaryCard extends StatelessWidget {
  final double laundryCost;
  final double additionalCost;
  final double totalPayment;

  const PaymentSummaryCard({
    super.key,
    required this.laundryCost,
    required this.additionalCost,
    required this.totalPayment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pesanan Anda', style: boldText14),
          const Divider(color: Colors.grey),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Prices Laundry / Kg', style: regularText12),
              Text('Rp ${laundryCost.toStringAsFixed(0)}',
                  style: regularText12),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Additional Cost', style: regularText12),
              Text('Rp ${additionalCost.toStringAsFixed(0)}',
                  style: regularText12),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Payment', style: boldText14),
              Text('Rp ${totalPayment.toStringAsFixed(0)}', style: boldText14),
            ],
          ),
        ],
      ),
    );
  }
}
