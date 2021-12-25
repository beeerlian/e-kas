import 'package:dartz/dartz.dart';
import 'package:ekas/data_source/local_data_source.dart';
import 'package:ekas/domain/models/finance.dart';
import 'package:ekas/utils/exception.dart';
import 'package:ekas/utils/failure.dart';

class InvoiceRepository {
  final LocalDataSource localDataSource;

  InvoiceRepository({
    required this.localDataSource,
  });

  Future<Either<Failure, List<Finance>>> getIncomes() async {
    try {
      final result = await localDataSource.getIncomes();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  Future<Either<Failure, List<Finance>>> getOutcomes() async {
    try {
      final result = await localDataSource.getOutcomes();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  Future<Either<Failure, Finance>> getIncomeDetail(int id) async {
    try {
      final result = await localDataSource.getIncomeById(id);
      return Right(result as Finance);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  Future<Either<Failure, Finance>> getOutcomeDetail(int id) async {
    try {
      final result = await localDataSource.getOutcomeById(id);
      return Right(result as Finance);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  Future<Either<Failure, String>> insertIncome(Finance finance) async {
    try {
      final result = await localDataSource.insertIncome(finance);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  Future<Either<Failure, String>> insertOutcome(Finance finance) async {
    try {
      final result = await localDataSource.insertOutcome(finance);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  Future<Either<Failure, String>> deleteIncome(Finance finance) async {
    try {
      final result = await localDataSource.deleteIncome(finance);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  Future<Either<Failure, String>> deleteOutcome(Finance finance) async {
    try {
      final result = await localDataSource.deleteOutcome(finance);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  Future<Either<Failure, List<Finance>>> getMonthlyIncomes(String date) async {
    try {
      final result = await localDataSource.getMonthlyIncomes(date);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  Future<Either<Failure, List<Finance>>> getMonthlyOutcomes(String date) async {
    try {
      final result = await localDataSource.getMonthlyOutcomes(date);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }
}
