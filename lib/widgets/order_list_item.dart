import 'package:flutter/material.dart';
import 'package:go_laundry/models/order.dart';
import 'package:go_laundry/models/service_type.dart';
import 'package:go_laundry/widgets/detail_button.dart';
import 'package:intl/intl.dart';

class OrderListItem extends StatelessWidget {
  final Order order;
  final VoidCallback onDetailPressed;

  const OrderListItem({
    Key? key,
    required this.order,
    required this.onDetailPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                order.iconPath,
                width: 48,
                height: 48,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.serviceType == ServiceType.cuciLipat
                          ? 'Cuci Lipat'
                          : 'Cuci Setrika',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp ${order.price.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      DateFormat('dd MMM, HH:mm').format(order.date),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '#${order.id}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DetailButton(onPressed: onDetailPressed),
                ],
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
