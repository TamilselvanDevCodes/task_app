import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:synchronized/synchronized.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();
  static Database? _database;
  final _lock = Lock();

  Future<Database> get database async {
    if (_database != null) return _database!;
    return _lock.synchronized(() async {
      _database ??= await _initDatabase();
      return _database!;
    });
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'task_app_database.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Tables will be created dynamically
      },
    );
  }

  Future<void> closeDatabase() async {
    final db = await database;
    db.close();
  }
}


