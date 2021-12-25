import 'package:ekas/data_source/db/database_helper.dart';
import 'package:ekas/data_source/local_data_source.dart';
import 'package:ekas/presentation/bloc/invoice_bloc.dart';
import 'package:ekas/repositories/invoice_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  //invoice bloc
  locator.registerFactory(() => InvoiceBloc(invoiceRepository: locator()));

  // repository
  locator.registerLazySingleton<InvoiceRepository>(() => InvoiceRepository(
        localDataSource: locator(),
      ));
  //movies data sources
  locator.registerLazySingleton<LocalDataSource>(
      () => LocalDataSource(databaseHelper: locator()));
  // tvshow & movies db helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
}
