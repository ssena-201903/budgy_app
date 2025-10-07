import 'package:flutter/foundation.dart';
import '../models/transaction.dart';

class TransactionsProvider with ChangeNotifier {
  final List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions.reversed.toList();

  void addTransaction(TransactionModel tx) {
    _transactions.add(tx);
    notifyListeners();
  }

  double get totalDeposits =>
      _transactions.where((tx) => tx.type == 'deposit').fold(0, (sum, tx) => sum + tx.amount);

  double get totalWithdrawals =>
      _transactions.where((tx) => tx.type == 'withdraw').fold(0, (sum, tx) => sum + tx.amount);
}
