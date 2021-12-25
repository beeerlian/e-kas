import 'package:ekas/domain/models/finance.dart';

class MonthlyInvoice {
  String month;
  List<Finance> finances;
  int nominal = 0;

  MonthlyInvoice({required this.month, required this.finances}) {
    if (finances.isNotEmpty) {
      for (var i = 0; i < finances.length; i++) {
        print("${int.parse(finances[i].nominal)}");
        nominal += int.parse(finances[i].nominal);
      }
    }
    nominal = nominal;
  }

  factory MonthlyInvoice.fromJson(Map<String, dynamic> json) => MonthlyInvoice(
      month: json["month"],
      finances: json['finances'] == null
          ? List<Finance>.generate(json['finances'].length,
              (index) => Finance.fromJson(json['finances'][index]))
          : []);

  int get getnominal {
    int nominal = 0;
    if (finances.isNotEmpty) {
      for (var i = 0; i < finances.length; i++) {
        nominal += int.parse(finances[i].nominal);
      }
    }
    return nominal;
  }
}
