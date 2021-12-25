part of 'invoice_bloc.dart';

abstract class InvoiceState extends Equatable {
  const InvoiceState();

  @override
  List<Object> get props => [];
}

class InvoiceInitial extends InvoiceState {}

class InvoiceLoading extends InvoiceState {}

class InvoiceEmpty extends InvoiceState {}

class IncomeHasData extends InvoiceState {
  List<Finance> incomes;
  IncomeHasData(this.incomes);
  @override
  List<Object> get props => [incomes];
}

class IncomeHasError extends InvoiceState {
  String message;
  IncomeHasError(this.message);
  @override
  List<Object> get props => [message];
}

class IncomeIsEmpty extends InvoiceState {
  @override
  List<Object> get props => [];
}

class OutcomeHasData extends InvoiceState {
  List<Finance> outcomes;
  OutcomeHasData(this.outcomes);
  @override
  List<Object> get props => [outcomes];
}

class OutcomeHasError extends InvoiceState {
  String message;
  OutcomeHasError(this.message);
  @override
  List<Object> get props => [message];
}

class OutcomeIsEmpty extends InvoiceState {
  @override
  List<Object> get props => [];
}

class SaveIncomeSuccess extends InvoiceState {
  String message;
  SaveIncomeSuccess(this.message);
  @override
  List<Object> get props => [message];
}

class SaveIncomeHasError extends InvoiceState {
  String message;
  SaveIncomeHasError(this.message);
  @override
  List<Object> get props => [message];
}

class SaveOutcomeSuccess extends InvoiceState {
  String message;
  SaveOutcomeSuccess(this.message);
  @override
  List<Object> get props => [message];
}

class SaveOutcomeHasError extends InvoiceState {
  String message;
  SaveOutcomeHasError(this.message);
  @override
  List<Object> get props => [message];
}

class MonthlyIncomesHasData extends InvoiceState {
  List<Finance> incomes;
  MonthlyIncomesHasData(this.incomes);
  @override
  List<Object> get props => [incomes];
}

class MonthlyIncomesHasError extends InvoiceState {
  String message;
  MonthlyIncomesHasError(this.message);
  @override
  List<Object> get props => [message];
}

class MonthlyIncomesIsEmpty extends InvoiceState {
  @override
  List<Object> get props => [];
}

class MonthlyOutcomesHasData extends InvoiceState {
  List<Finance> incomes;
  MonthlyOutcomesHasData(this.incomes);
  @override
  List<Object> get props => [incomes];
}

class MonthlyOutcomesHasError extends InvoiceState {
  String message;
  MonthlyOutcomesHasError(this.message);
  @override
  List<Object> get props => [message];
}

class MonthlyOutcomesIsEmpty extends InvoiceState {
  @override
  List<Object> get props => [];
}
