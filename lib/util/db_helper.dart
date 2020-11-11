import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {

  static final DBHelper instance = DBHelper._internal();
  factory DBHelper() {
    return instance;
  }
  DBHelper._internal();

  static const String dbName = 'stats.db';
  static const String inventory = 'inventory';
  static const String succulents = 'succulents';
  static const String guardians = 'guardians';
  static const int dbVersion = 1;
  Database db;

  Future<Database> get database async {
    if (db != null) return db;
    // lazily instantiate the db the first time it is accessed
    db = await initDB();
    return db;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    return await openDatabase(path,
        version: dbVersion,
        onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    await db.execute('PRAGMA foreign_keys = ON');
    await db.execute('CREATE TABLE inventory ('
        + 'name TEXT NOT NULL PRIMARY KEY,'
        + 'amount INTEGER NOT NULL)');
    await db.execute('CREATE TABLE succulents ('
        + 'name TEXT NOT NULL,'
        + 'place INTEGER NOT NULL,'
        + 'health REAL NOT NULL,'
        + 'hydration REAL NOT NULL,'
        + 'minerals REAL NOT NULL,'
        + 'temperature REAL NOT NULL)');
    await db.execute('CREATE TABLE guardians ('
        + 'name TEXT)');
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<int> delete(String table, String name) async {
    Database db = await instance.database;
    return await db.delete(table, where: 'name = ?', whereArgs: [name]);
  }

  Future<int> update(String table, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.update(table, row, where: 'name = ?', whereArgs: [row['name']]);
  }

}