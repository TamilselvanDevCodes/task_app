import 'database_helper.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'database_model.dart';

class ModelRepository<T extends DatabaseModel> {
  final String tableName;
  final String createTableQuery;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  ModelRepository({required this.tableName, required this.createTableQuery}) {
    createTable();
  }

  Future<void> createTable() async {
    final db = await _dbHelper.database;
    await db.execute(createTableQuery);
  }

  Future<int> insert({required T model}) async {
    final db = await _dbHelper.database;
    return await db.insert(tableName, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<T>> getAll(
      {required T Function(Map<String, dynamic>) fromMap}) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps.map((map) => fromMap(map)).toList();
  }

  Future<List<T>> get({
    required T Function(Map<String, dynamic>) fromMap,
    required String where,
    required List<dynamic> whereArgs,
  }) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
    return maps.map((map) => fromMap(map)).toList();
  }

  Future<int> update(
      {required T model,
      required String where,
      required List<dynamic> whereArgs}) async {
    final db = await _dbHelper.database;
    return await db.update(tableName, model.toMap(),
        where: where, whereArgs: whereArgs);
  }

  Future<int> delete(
      {required String where, required List<dynamic> whereArgs}) async {
    final db = await _dbHelper.database;
    return await db.delete(tableName, where: where, whereArgs: whereArgs);
  }
}
