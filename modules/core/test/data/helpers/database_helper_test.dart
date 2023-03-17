import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper_test.mocks.dart';

@GenerateMocks([
  Database,
  WatchlistTable,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockDatabase mockDatabase;
  late MockWatchlistTable mockWatchlistTable;
  late DatabaseHelper databaseHelper;

  setUp(() {
    mockDatabase = MockDatabase();
    mockWatchlistTable = MockWatchlistTable();

    databaseHelper = DatabaseHelperImpl(mockDatabase);
  });

  test('should return a number when insert watchlist success', () async {
    when(mockWatchlistTable.toJson()).thenReturn({});
    when(mockDatabase.insert(kTableWatchlist, any)).thenAnswer((_) async => 1);

    final result = await databaseHelper.insertWatchlist(mockWatchlistTable);

    expect(result, 1);
  });

  test('should return a number when remove watchlist success', () async {
    when(mockWatchlistTable.toJson()).thenReturn({});
    when(mockWatchlistTable.id).thenReturn(1);
    when(mockDatabase.delete(
      kTableWatchlist,
      where: 'id = ?',
      whereArgs: [1],
    )).thenAnswer((_) async => 1);

    final result = await databaseHelper.removeWatchlist(mockWatchlistTable);

    expect(result, 1);
  });

  test('should return a specific json data when get watchlist by id success',
      () async {
    when(mockWatchlistTable.toJson()).thenReturn({});
    when(mockWatchlistTable.id).thenReturn(1);
    when(mockDatabase.query(
      kTableWatchlist,
      where: 'id = ? AND type = ?',
      whereArgs: [1, 'test'],
    )).thenAnswer((_) async => [{}]);

    final result =
        await databaseHelper.getWatchlistById(mockWatchlistTable.id, 'test');

    expect(result, {});
  });

  test('should return a list of json data when get watchlist success',
      () async {
    when(mockWatchlistTable.toJson()).thenReturn({});
    when(mockWatchlistTable.id).thenReturn(1);
    when(mockDatabase.query(
      kTableWatchlist,
      where: 'type = ?',
      whereArgs: ['test'],
    )).thenAnswer((_) async => [{}]);

    final result = await databaseHelper.getWatchlist('test');

    expect(result, [{}]);
  });
}
