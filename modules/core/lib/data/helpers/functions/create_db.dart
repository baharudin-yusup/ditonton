// coverage:ignore-start
import 'package:sqflite/sqflite.dart';

import '../../../common/constants.dart';

Future<Database> createDb() async {
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

  return await openDatabase(databasePath, version: 2, onCreate: onCreate);
}
// coverage:ignore-end
