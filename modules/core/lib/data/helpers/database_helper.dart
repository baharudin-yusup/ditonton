import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../../common/constants.dart';
import '../models/watchlist_table.dart';

abstract class DatabaseHelper {
  Future<int> insertWatchlist(WatchlistTable watchlist);

  Future<int> removeWatchlist(WatchlistTable watchlist);

  Future<Map<String, dynamic>?> getWatchlistById(int id, String type);

  Future<List<Map<String, dynamic>>> getWatchlist(String type);

  Future<void> init([Database? preInitDb]);
}

class DatabaseHelperImpl implements DatabaseHelper {
  late final Database _database;

  DatabaseHelperImpl();

  @override
  Future<void> init([Database? preInitDb]) async {
    if (preInitDb != null) {
      _database = preInitDb;
      return;
    }
    void onCreate(Database db, int version) async {
      await db.execute('''
      CREATE TABLE  $kTableWatchlist (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT,
        type TEXT
      );
    ''');
    }

    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton.db';

    var db = await openDatabase(databasePath, version: 2, onCreate: onCreate);
    _database = db;
  }

  @override
  Future<int> insertWatchlist(WatchlistTable watchlist) async {
    final db = _database;
    return await db.insert(kTableWatchlist, watchlist.toJson());
  }

  @override
  Future<int> removeWatchlist(WatchlistTable watchlist) async {
    final db = _database;
    return await db.delete(
      kTableWatchlist,
      where: 'id = ?',
      whereArgs: [watchlist.id],
    );
  }

  @override
  Future<Map<String, dynamic>?> getWatchlistById(int id, String type) async {
    final db = _database;
    final results = await db.query(
      kTableWatchlist,
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

  @override
  Future<List<Map<String, dynamic>>> getWatchlist(String type) async {
    final db = _database;
    final List<Map<String, dynamic>> results = await db.query(
      kTableWatchlist,
      where: 'type = ?',
      whereArgs: [type],
    );

    return results;
  }
}
