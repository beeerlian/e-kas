import 'package:bloc/bloc.dart';
import 'package:ekas/domain/models/finance.dart';
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
