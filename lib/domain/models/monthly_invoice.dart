import 'package:ekas/domain/models/finance.dart';

class MonthlyInvoice {
  String nominal;
  String month;
  List<Finance> finances;

  MonthlyInvoice(
      {required this.finances, required this.month, required this.nominal});
}
