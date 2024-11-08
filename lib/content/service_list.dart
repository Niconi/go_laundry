import 'package:flutter/material.dart';
import 'package:go_laundry/models/service.dart';
import 'package:go_laundry/widgets/service_box.dart';

class ServiceList extends StatelessWidget {
  final List<ServiceModel> services = [
    ServiceModel(title: 'Cuci Lipat', image: 'assets/icons/lipat.png'),
    ServiceModel(title: 'Cuci Setrika', image: 'assets/icons/setrika.png'),
    ServiceModel(title: 'Cuci Kering', image: 'assets/icons/kering.png'),
    ServiceModel(title: 'Cuci Tas', image: 'assets/icons/tas.png'),
    ServiceModel(title: 'Cuci Sepatu', image: 'assets/icons/sepatu.png'),
    ServiceModel(title: 'Cuci Karpet', image: 'assets/icons/karpet.png'),
  ];

  final Function(String) onServiceSelected;

  ServiceList({Key? key, required this.onServiceSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return ServiceBox(
          title: service.title,
          image: service.image,
          onTap: () => onServiceSelected(
              service.title), 
        );
      },
    );
  }
}
