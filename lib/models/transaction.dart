class TransactionModel {
  final String id;
  final String memberId; // which member made the transaction
  final double amount;
  final String type; // e.g., "income", "expense"
  final String description;
  final DateTime date;

  TransactionModel({
    required this.id,
    required this.memberId,
    required this.amount,
    required this.type,
    required this.description,
    required this.date,
  });
}
