import 'package:budgy_project/models/transaction.dart';
import 'package:budgy_project/providers/member_provider.dart';
import 'package:budgy_project/providers/transaction_provider.dart';
import 'package:flutter/foundation.dart';

class PoolProvider with ChangeNotifier {
  final MembersProvider membersProvider;
  final TransactionsProvider transactionsProvider;

  PoolProvider({
    required this.membersProvider,
    required this.transactionsProvider,
  });

  double get totalBalance {
    return transactionsProvider.totalDeposits - transactionsProvider.totalWithdrawals;
  }

  void deposit(String memberId, double amount, String description) {
    transactionsProvider.addTransaction(
      TransactionModel(
        id: DateTime.now().toString(),
        memberId: memberId,
        amount: amount,
        type: 'deposit',
        description: description,
        date: DateTime.now(),
      ),
    );
    membersProvider.updateContribution(memberId, amount);
    notifyListeners();
  }

  void withdraw(String memberId, double amount, String description) {
    transactionsProvider.addTransaction(
      TransactionModel(
        id: DateTime.now().toString(),
        memberId: memberId,
        amount: amount,
        type: 'withdraw',
        description: description,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
