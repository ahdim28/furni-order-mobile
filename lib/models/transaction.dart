class TransactionModel {
  final String id;
  final String noTrx;
  final String date;
  final double amount;
  final String status;

  TransactionModel({
    required this.id,
    required this.noTrx,
    required this.date,
    required this.amount,
    required this.status,
  });
}
