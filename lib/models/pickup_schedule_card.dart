import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class PickupScheduleCard extends StatelessWidget {
  final String orderNumber;
  final String pickupSchedule;
  final String deliverySchedule;

  const PickupScheduleCard({
    super.key,
    required this.orderNumber,
    required this.pickupSchedule,
    required this.deliverySchedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/laundry.png',
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order #$orderNumber',
                  style: boldText14,
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        'Jadwal Penjemputan :',
                        style: regularText12,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        pickupSchedule,
                        style: regularText12,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        'Jadwal Pengantaran :',
                        style: regularText12,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        deliverySchedule,
                        style: regularText12,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
