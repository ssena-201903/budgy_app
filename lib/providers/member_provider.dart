import 'package:flutter/foundation.dart';
import '../models/member.dart';

class MembersProvider with ChangeNotifier {
  final List<Member> _members = [];

  List<Member> get members => _members;

  void addMember(Member member) {
    _members.add(member);
    notifyListeners();
  }

  void updateContribution(String id, double amount) {
    final member = _members.firstWhere((m) => m.id == id);
    member.contribution += amount;
    notifyListeners();
  }
}
