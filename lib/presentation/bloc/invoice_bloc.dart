import 'package:bloc/bloc.dart';
import 'package:ekas/common/invoice_report.dart';
import 'package:ekas/domain/models/finance.dart';
import 'package:ekas/domain/models/monthly_invoice.dart';
import 'package:ekas/repositories/invoice_repository.dart';
import 'package:equatable/equatable.dart';

part 'invoice_event.dart';
part 'invoice_state.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  InvoiceRepository invoiceRepository;

  InvoiceBloc({required this.invoiceRepository}) : super(InvoiceEmpty()) {
    on<SaveIncomeEvent>(saveIncomeEventHandler);
    on<SaveOutcomeEvent>(saveOutcomeEventHandler);
    on<GetIncomesEvent>(getIncomesEventHandler);
    on<GetOutcomesEvent>(getOutcomesEventHandler);
    on<GetMonthlyIncomesEvent>(getMonthlyIncomesEventHandler);
    on<GetYearlyIncomesEvent>(getYearlyIncomesEventHandler);
  }

  Future<void> getMonthlyIncomesEventHandler(
      GetMonthlyIncomesEvent event, Emitter<InvoiceState> emit) async {
    emit(InvoiceLoading());
    final result = await invoiceRepository
        .getMonthlyIncomes(event.date.toString().padLeft(2, '0'));

    result.fold((failure) {
      emit(OutcomeHasError(failure.message));
    }, (result) {
      if (result.isNotEmpty) {
        emit(OutcomeHasData(result));
      } else {
        emit(OutcomeIsEmpty());
      }
    });
  }

  Future<void> getYearlyIncomesEventHandler(
      GetYearlyIncomesEvent event, Emitter<InvoiceState> emit) async {
    emit(InvoiceLoading());
    final incomesInvoices = await getYearIncomes(event.year);
    final incomes = InvoiceReport.init(incomesInvoices, event.year);
    final outcomesInvoices = await getYearOutcomes(event.year);
    final outcomes = InvoiceReport.init(outcomesInvoices, event.year);
    emit(YearlyIncomesHasData(incomes, outcomes));
  }

  Future<List<MonthlyInvoice>> getYearOutcomes(int year) async {
    List<MonthlyInvoice> invoices = [];
    for (var i = 1; i <= 12; i++) {
      String date = i.toString().padLeft(2, '0');
      final result = await invoiceRepository.getMonthlyOutcomes(date);
      print(result.toString());
      result.fold((failure) {
        invoices.add(MonthlyInvoice(month: date, finances: []));
        print("Error");
      }, (result) {
        if (result.isNotEmpty) {
          invoices.add(MonthlyInvoice(finances: result, month: date));
          print("Data Invoice bulan $date sebanyak ${result.length} buah");
        } else {
          invoices.add(MonthlyInvoice(month: date, finances: []));
          print("Data Invoice bulan $date kosong");
        }
      });
    }
    return invoices;
  }

  Future<List<MonthlyInvoice>> getYearIncomes(int year) async {
    List<MonthlyInvoice> invoices = [];
    for (var i = 1; i <= 12; i++) {
      String date = i.toString().padLeft(2, '0');
      final result = await invoiceRepository.getMonthlyIncomes(date);
      print(result.toString());
      result.fold((failure) {
        invoices.add(MonthlyInvoice(month: date, finances: []));
        print("Error");
      }, (result) {
        if (result.isNotEmpty) {
          invoices.add(MonthlyInvoice(finances: result, month: date));
          print("Data Invoice bulan $date sebanyak ${result.length} buah");
        } else {
          invoices.add(MonthlyInvoice(month: date, finances: []));
          print("Data Invoice bulan $date kosong");
        }
      });
    }
    return invoices;
  }

  Future<void> getOutcomesEventHandler(
      GetOutcomesEvent event, Emitter<InvoiceState> emit) async {
    emit(InvoiceLoading());
    final result = await invoiceRepository.getOutcomes();
    result.fold((failure) {
      emit(OutcomeHasError(failure.message));
    }, (result) {
      if (result.isNotEmpty) {
        emit(OutcomeHasData(result));
      } else {
        emit(OutcomeIsEmpty());
      }
    });
  }

  Future<void> getIncomesEventHandler(
      GetIncomesEvent event, Emitter<InvoiceState> emit) async {
    emit(InvoiceLoading());
    final result = await invoiceRepository.getIncomes();
    result.fold((failure) {
      emit(IncomeHasError(failure.message));
    }, (result) {
      if (result.isNotEmpty) {
        emit(IncomeHasData(result));
      } else {
        emit(IncomeIsEmpty());
      }
    });
  }

  Future<void> saveIncomeEventHandler(
      SaveIncomeEvent event, Emitter<InvoiceState> emit) async {
    emit(InvoiceLoading());
    final result = await invoiceRepository.insertIncome(event.finance);
    result.fold((failure) {
      emit(SaveIncomeHasError(failure.message));
    }, (result) {
      emit(SaveIncomeSuccess(result));
    });
  }

  Future<void> saveOutcomeEventHandler(
      SaveOutcomeEvent event, Emitter<InvoiceState> emit) async {
    emit(InvoiceLoading());
    final result = await invoiceRepository.insertOutcome(event.finance);
    result.fold((failure) {
      emit(SaveOutcomeHasError(failure.message));
    }, (result) {
      emit(SaveOutcomeSuccess(result));
    });
  }
}
