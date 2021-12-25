part of 'invoice_bloc.dart';

abstract class InvoiceEvent extends Equatable {
  const InvoiceEvent();

  @override
  List<Object> get props => [];
}

class SaveIncomeEvent extends InvoiceEvent {
  Finance finance;
  SaveIncomeEvent(this.finance);

  @override
  List<Object> get props => [finance];
}

class SaveOutcomeEvent extends InvoiceEvent {
  Finance finance;
  SaveOutcomeEvent(this.finance);

  @override
  List<Object> get props => [finance];
}

class GetIncomesEvent extends InvoiceEvent {
  GetIncomesEvent();

  @override
  List<Object> get props => [];
}

class GetOutcomesEvent extends InvoiceEvent {
  GetOutcomesEvent();

  @override
  List<Object> get props => [];
}

class GetMonthlyOutcomesEvent extends InvoiceEvent {
  GetMonthlyOutcomesEvent();

  @override
  List<Object> get props => [];
}

class GetMonthlyIncomesEvent extends InvoiceEvent {
  int date;
  GetMonthlyIncomesEvent(this.date);
  @override
  List<Object> get props => [];
}

class GetYearlyIncomesEvent extends InvoiceEvent {
  int year;
  GetYearlyIncomesEvent(this.year);
  @override
  List<Object> get props => [];
}
