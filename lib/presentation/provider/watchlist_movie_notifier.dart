import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/domain/usecases/get_movie_watchlist.dart';
import 'package:ditonton/domain/usecases/get_tv_show_watchlist.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/movie.dart';

class WatchlistNotifier extends ChangeNotifier {
  var _moviesWatchlist = <Movie>[];
  var _tvShowsWatchlist = <TvShow>[];

  List<Watchlist> get moviesWatchlist =>
      _moviesWatchlist.map((movie) => movie.toWatchlist()).toList();

  List<Watchlist> get tvShowsWatchlist =>
      _tvShowsWatchlist.map((movie) => movie.toWatchlist()).toList();

  var _moviesWatchlistState = RequestState.Empty;
  var _tvShowsWatchlistState = RequestState.Empty;

  RequestState get moviesWatchlistState => _moviesWatchlistState;
  RequestState get tvShowsWatchlistState => _tvShowsWatchlistState;

  String _moviesMessage = '';
  String _tvShowsMessage = '';

  String get moviesMessage => _moviesMessage;
  String get tvShowsMessage => _tvShowsMessage;

  WatchlistNotifier({
    required this.getWatchlistMovies,
    required this.getTvShowWatchlist,
  });

  final GetMovieWatchlist getWatchlistMovies;
  final GetTvShowWatchlist getTvShowWatchlist;

  Future<void> fetchWatchlistMovies() async {
    _moviesWatchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistMovies();
    result.fold(
      (failure) {
        _moviesWatchlistState = RequestState.Error;
        _moviesMessage = failure.message;
        notifyListeners();
      },
      (datum) {
        _moviesWatchlistState = RequestState.Loaded;
        _moviesWatchlist = datum;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTvShowsWatchlist() async {
    _tvShowsWatchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getTvShowWatchlist();
    result.fold(
      (failure) {
        _tvShowsWatchlistState = RequestState.Error;
        _tvShowsMessage = failure.message;
        notifyListeners();
      },
      (datum) {
        _tvShowsWatchlistState = RequestState.Loaded;
        _tvShowsWatchlist = datum;
        notifyListeners();
      },
    );
  }
}
