class ServiceOption {
  final String serviceName;
  final List<String> options;

  ServiceOption({
    required this.serviceName,
    required this.options,
  });
}

final List<ServiceOption> serviceOptions = [
  ServiceOption(
    serviceName: 'Cuci Lipat',
    options: [
      'Kaos',
      'Kemeja',
      'Celana',
      'Piyama',
      'Sprei',
      'Selimut',
      'Handuk',
      'Jaket',
      'Topi',
      'Handbag',
      'Sarung Bantal',
    ],
  ),
  ServiceOption(
    serviceName: 'Cuci Setrika',
    options: [
      'Kaos',
      'Kemeja',
      'Celana',
      'Piyama',
      'Sprei',
      'Selimut',
      'Handuk',
      'Jaket',
      'Blazer',
      'Celana Jeans',
    ],
  ),
  ServiceOption(
    serviceName: 'Cuci Kering',
    options: [
      'Kaos',
      'Kemeja',
      'Celana',
      'Piyama',
      'Sprei',
      'Selimut',
      'Handuk',
      'Karpet',
      'Towel Set',
      'Linen',
    ],
  ),
  ServiceOption(
    serviceName: 'Cuci Tas',
    options: [
      'Tas Kulit',
      'Tas Sintesis',
      'Tas Kain',
      'Backpack',
      'Tote Bag',
      'Clutch',
    ],
  ),
  ServiceOption(
    serviceName: 'Cuci Sepatu',
    options: [
      'Sepatu Kulit',
      'Sepatu Kanvas',
      'Sepatu Olahraga',
      'Boots',
      'Sneakers',
      'Sepatu Pantofel',
    ],
  ),
  ServiceOption(
    serviceName: 'Cuci Karpet',
    options: [
      'Karpet Bulu',
      'Karpet Sintetis',
      'Karpet Tradisional',
      'Karpet Shaggy',
      'Karpet Bulu Jumbai',
    ],
  ),
];
