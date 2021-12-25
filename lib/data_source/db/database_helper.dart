import 'dart:async';

import 'package:ekas/common/encrypt.dart';
import 'package:ekas/domain/models/finance.dart';
import 'package:sqflite_sqlcipher/sqflite.dart' as sqf;

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static sqf.Database? _database;

  Future<sqf.Database?> get database async {
    if (_database == null) {
      _database = await _initDb();
    }
    return _database;
  }

  static const String _tblIncome = 'incomes';
  static const String _tblOutcome = 'outcomes';

  Future<sqf.Database> _initDb() async {
    final path = await sqf.getDatabasesPath();
    final databasePath = '$path/ekas.db';

    var db = await sqf.openDatabase(databasePath,
        version: 2,
        onCreate: _onCreate,
        password: encrypt('Your secure password...'));
    return db;
  }

  void _onCreate(sqf.Database db, int version) async {
    await db.execute("""
      CREATE TABLE $_tblIncome(
        id INTEGER PRIMARY KEY,
        nominal TEXT,
        desc TEXT,
        date TEXT
      );
    """);
    await db.execute("""
      CREATE TABLE  $_tblOutcome(
        id INTEGER PRIMARY KEY,
        nominal TEXT,
        desc TEXT,
        date TEXT
      );
    """);
  }

  Future<void> insertIncomesTransaction(
      List<Finance> incomes, String category) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final income in incomes) {
        final incomeJson = income.toJson();
        txn.insert(_tblIncome, incomeJson);
      }
    });
  }

  Future<void> insertOutcomesTransaction(
      List<Finance> outcomes, String category) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final outcome in outcomes) {
        final outcomeJson = outcome.toJson();
        txn.insert(_tblOutcome, outcomeJson);
      }
    });
  }

  Future<List<Map<String, dynamic>>> getIncomes() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblIncome);

    return results;
  }

  Future<List<Map<String, dynamic>>> getOutcomes() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblOutcome);

    return results;
  }

  Future<int> deleteIncome(Finance finance) async {
    final db = await database;
    return await db!.delete(
      _tblIncome,
      where: 'id = ?',
      whereArgs: [finance.id],
    );
  }

  Future<int> deleteOutcome(Finance finance) async {
    final db = await database;
    return await db!.delete(
      _tblOutcome,
      where: 'id = ?',
      whereArgs: [finance.id],
    );
  }

  Future<int> insertIncome(Finance finance) async {
    final db = await database;
    return await db!.insert(_tblIncome, finance.toJson());
  }

  Future<int> insertOutcome(Finance finance) async {
    final db = await database;
    return await db!.insert(_tblOutcome, finance.toJson());
  }

  Future<Map<String, dynamic>?> getIncomeById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblIncome,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getOutcomeById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblOutcome,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }
}
