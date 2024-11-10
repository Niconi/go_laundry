class ReceiptModel {
  final double totalPayment;
  final String referenceNumber;
  final DateTime paymentTime;
  final String paymentMethod;
  final String washType;

  ReceiptModel({
    required this.totalPayment,
    required this.referenceNumber,
    required this.paymentTime,
    required this.paymentMethod,
    required this.washType,
  });

  factory ReceiptModel.fromJson(Map<String, dynamic> json) {
    return ReceiptModel(
      totalPayment: json['totalPayment'] ?? 0.0,
      referenceNumber: json['referenceNumber'] ?? '',
      paymentTime: DateTime.parse(json['paymentTime'] ?? ''),
      paymentMethod: json['paymentMethod'] ?? '',
      washType: json['washType'] ?? '',
    );
  }
}
