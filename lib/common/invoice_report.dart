import 'package:ekas/domain/models/monthly_invoice.dart';

class InvoiceReportMonthly {}

class InvoiceReport {
  int year;

  List<MonthlyInvoice> invoicesMonthly;

  // MonthlyInvoice? january;
  // MonthlyInvoice? february;
  // MonthlyInvoice? march;
  // MonthlyInvoice? april;
  // MonthlyInvoice? mei;
  // MonthlyInvoice? june;
  // MonthlyInvoice? july;
  // MonthlyInvoice? august;
  // MonthlyInvoice? september;
  // MonthlyInvoice? october;
  // MonthlyInvoice? november;
  // MonthlyInvoice? december;

  InvoiceReport({
    required this.year,
    required this.invoicesMonthly,
    // this.january,
    // this.february,
    // this.march,
    // this.april,
    // this.mei,
    // this.june,
    // this.july,
    // this.august,
    // this.september,
    // this.october,
    // this.november,
    // this.december
  });

  factory InvoiceReport.init(List<MonthlyInvoice> invoices, int year) {
    print("Jumlah Invoice ${invoices.length}");
    return InvoiceReport(
      year: year,
      invoicesMonthly: invoices,
      // january: invoices[0],
      // february: invoices[1],
      // march: invoices[2],
      // april: invoices[3],
      // mei: invoices[4],
      // june: invoices[5],
      // july: invoices[6],
      // august: invoices[7],
      // september: invoices[8],
      // october: invoices[9],
      // november: invoices[10],
      // december: invoices[11]
    );
  }
}
