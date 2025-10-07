class Member {
  final String id;
  final String name;
  double contribution; // contribution amount

  Member({
    required this.id,
    required this.name,
    this.contribution = 0,
  });
}
