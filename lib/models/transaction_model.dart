class TransactionModel {
  final double balance;
  final List<TransactionItem> transactions;

  TransactionModel({
    required this.balance,
    required this.transactions,
  });
}

class TransactionItem {
  final DateTime date;
  final String serviceIcon;
  final String serviceChoice;
  final double amount;

  TransactionItem({
    required this.date,
    required this.serviceIcon,
    required this.serviceChoice,
    required this.amount,
  });
}