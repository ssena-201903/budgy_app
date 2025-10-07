import 'package:budgy_project/models/member.dart';
import 'package:budgy_project/models/transaction.dart';

class Pool {
  double totalBalance;
  List<Member> members;
  List<TransactionModel> transactions;

  Pool({
    required this.totalBalance,
    required this.members,
    required this.transactions,
  });
}
