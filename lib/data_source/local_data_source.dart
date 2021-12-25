import 'package:ekas/data_source/db/database_helper.dart';
import 'package:ekas/domain/models/finance.dart';
import 'package:ekas/utils/exception.dart';

class LocalDataSource {
  final DatabaseHelper databaseHelper;

  LocalDataSource({required this.databaseHelper});

  Future<String> insertIncome(Finance finance) async {
    try {
      await databaseHelper.insertIncome(finance);
      return 'Added';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  Future<String> insertOutcome(Finance finance) async {
    try {
      await databaseHelper.insertOutcome(finance);
      return 'Added';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  Future<String> deleteIncome(Finance finance) async {
    try {
      await databaseHelper.deleteIncome(finance);
      return 'Removed';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  Future<String> deleteOutcome(Finance finance) async {
    try {
      await databaseHelper.deleteOutcome(finance);
      return 'Removed';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  Future<Finance?> getIncomeById(int id) async {
    final result = await databaseHelper.getIncomeById(id);
    if (result != null) {
      return Finance.fromJson(result);
    } else {
      return null;
    }
  }

  Future<Finance?> getOutcomeById(int id) async {
    final result = await databaseHelper.getOutcomeById(id);
    if (result != null) {
      return Finance.fromJson(result);
    } else {
      return null;
    }
  }

  Future<List<Finance>> getIncomes() async {
    final result = await databaseHelper.getIncomes();
    return result.map((data) => Finance.fromJson(data)).toList();
  }

  Future<List<Finance>> getOutcomes() async {
    final result = await databaseHelper.getOutcomes();
    return result.map((data) => Finance.fromJson(data)).toList();
  }

  Future<List<Finance>> getMonthlyOutcomes(String date) async {
    final result = await databaseHelper.getMonthlyOutcomes(date);
    return result.map((data) => Finance.fromJson(data)).toList();
  }

  Future<List<Finance>> getMonthlyIncomes(String date) async {
    final result = await databaseHelper.getMonthlyIncomes(date);
    return result.map((data) => Finance.fromJson(data)).toList();
  }
}
