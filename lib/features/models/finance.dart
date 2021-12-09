import 'package:hive/hive.dart';

part 'finance.g.dart';

@HiveType(typeId: 1)
class Finance {
  @HiveField(0)
  String nominal;

  @HiveField(1)
  String desc;

  @HiveField(2)
  String date;

  @HiveField(3)
  bool isIncome;

  Finance(
      {required this.desc,
      required this.date,
      required this.nominal,
      required this.isIncome});
}
