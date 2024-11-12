import 'package:go_laundry/models/service_type.dart';

class Order {
  final String id;
  final ServiceType serviceType;
  final double price;
  final DateTime date;
  final String iconPath;

  Order({
    required this.id,
    required this.serviceType,
    required this.price,
    required this.date,
    required this.iconPath,
  });
}