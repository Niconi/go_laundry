import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class OrderDetailsCard extends StatelessWidget {
  final String pickupAddress;
  final String orderDate;
  final String clothingDetails;

  const OrderDetailsCard({
    super.key,
    required this.pickupAddress,
    required this.orderDate,
    required this.clothingDetails,
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
          Text('Order Details', style: boldText14),
          const SizedBox(height: 10),
          Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FixedColumnWidth(15), // Width for ":"
              2: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            children: [
              TableRow(
                children: [
                  Text(
                    'Alamat Penjemputan',
                    style: semiBoldText12.copyWith(color: charcoalColor),
                  ),
                  Text(
                    '  :',
                    style: regularText12,
                  ),
                  Text(
                    pickupAddress,
                    style: regularText12,
                  ),
                ],
              ),
              const TableRow(
                children: [
                  SizedBox(height: 2),
                  SizedBox(height: 2),
                  SizedBox(height: 2),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    'Tanggal Order',
                    style: semiBoldText12,
                  ),
                  Text(
                    '  :',
                    style: regularText12,
                  ),
                  Text(
                    orderDate,
                    style: regularText12,
                  ),
                ],
              ),
              const TableRow(
                children: [
                  SizedBox(height: 2),
                  SizedBox(height: 2),
                  SizedBox(height: 2),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    'Detail Pakaian',
                    style: semiBoldText12,
                  ),
                  Text(
                    '  :',
                    style: regularText12,
                  ),
                  Text(
                    clothingDetails,
                    style: regularText12,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
