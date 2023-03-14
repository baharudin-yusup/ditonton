import 'package:core/domain/entities/watchlist.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_tv_show_watchlist.dart';
import 'package:flutter/foundation.dart';

class WatchlistMovieNotifier extends ChangeNotifier {
  var _watchlist = <Watchlist>[];

  List<Watchlist> get watchlist => _watchlist;

  var _watchlistState = RequestState.Empty;

  RequestState get watchlistState => _watchlistState;

  String _message = '';

  String get message => _message;

  WatchlistMovieNotifier({
    required this.getWatchlistTvShow,
  });

  final GetTvShowWatchlist getWatchlistTvShow;

  Future<void> fetchWatchlistMovies() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTvShow();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (datum) {
        _watchlistState = RequestState.Loaded;
        _watchlist = datum;
        notifyListeners();
      },
    );
  }
}
