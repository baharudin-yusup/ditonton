import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../models/watchlist_table.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblWatchlist = 'watchlist';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton.db';

    var db = await openDatabase(databasePath, version: 2, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblWatchlist (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT,
        type TEXT
      );
    ''');
  }

  Future<int> insertWatchlist(WatchlistTable watchlist) async {
    final db = await database;
    return await db!.insert(_tblWatchlist, watchlist.toJson());
  }

  Future<int> removeWatchlist(WatchlistTable watchlist) async {
    final db = await database;
    return await db!.delete(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [watchlist.id],
    );
  }

  Future<Map<String, dynamic>?> getWatchlistById(int id, String type) async {
    final db = await database;
    final results = await db!.query(
      _tblWatchlist,
      where: 'id = ? AND type = ?',
      whereArgs: [
        id,
        type,
      ],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlist(String type) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(
      _tblWatchlist,
      where: 'type = ?',
      whereArgs: [type],
    );

    return results;
  }
}
