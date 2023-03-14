import 'package:core/common/exception.dart';
import 'package:core/data/helpers/database_helper.dart';

import '../models/tv_show_table.dart';

abstract class TvShowLocalDataSource {
  Future<String> insertWatchlist(TvShowTable tvShow);

  Future<String> removeWatchlist(TvShowTable tvShow);

  Future<TvShowTable?> getTvShowById(int id);

  Future<List<TvShowTable>> getWatchlistTvShows();
}

class TvShowLocalDataSourceImpl implements TvShowLocalDataSource {
  final DatabaseHelper databaseHelper;

  TvShowLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlist(TvShowTable movie) async {
    try {
      await databaseHelper.insertWatchlist(movie);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(TvShowTable movie) async {
    try {
      await databaseHelper.removeWatchlist(movie);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<TvShowTable?> getTvShowById(int id) async {
    final result = await databaseHelper.getWatchlistById(id, 'tv_show');
    if (result != null) {
      return TvShowTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TvShowTable>> getWatchlistTvShows() async {
    final result = await databaseHelper.getWatchlist('tv_show');
    return result.map((data) => TvShowTable.fromMap(data)).toList();
  }
}
