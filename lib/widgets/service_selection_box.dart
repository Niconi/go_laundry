import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class ServiceSelectionBox extends StatelessWidget {
  final String serviceName;

  const ServiceSelectionBox({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Text('Jenis Layanan: ', style: boldText14),
          Expanded(
            child: Text(serviceName, style: boldText14),
          ),
        ],
      ),
    );
  }
}
