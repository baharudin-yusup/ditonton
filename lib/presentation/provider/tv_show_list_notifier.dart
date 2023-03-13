import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/domain/usecases/get_now_airing_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:flutter/material.dart';

class TvShowListNotifier extends ChangeNotifier {
  var _nowAiring = <TvShow>[];
  var _popular = <TvShow>[];
  var _topRated = <TvShow>[];

  RequestState _nowPlayingState = RequestState.Empty;
  RequestState _popularMoviesState = RequestState.Empty;
  RequestState _topRatedMoviesState = RequestState.Empty;

  String _message = '';

  List<Watchlist> get nowPlaying =>
      _nowAiring.map((data) => data.toWatchlist()).toList();

  RequestState get nowPlayingState => _nowPlayingState;

  List<Watchlist> get popular =>
      _popular.map((data) => data.toWatchlist()).toList();

  RequestState get popularState => _popularMoviesState;

  List<Watchlist> get topRated =>
      _topRated.map((data) => data.toWatchlist()).toList();

  RequestState get topRatedState => _topRatedMoviesState;

  String get message => _message;

  TvShowListNotifier(this._getNowAiringTvShows, this._getPopularTvShows,
      this._getTopRatedTvShows);

  final GetNowAiringTvShows _getNowAiringTvShows;
  final GetPopularTvShows _getPopularTvShows;
  final GetTopRatedTvShows _getTopRatedTvShows;

  Future<void> fetchNowAiringTvShows() async {
    _nowPlayingState = RequestState.Loading;
    notifyListeners();

    final result = await _getNowAiringTvShows();
    result.fold(
      (failure) {
        _nowPlayingState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (datum) {
        _nowPlayingState = RequestState.Loaded;
        _nowAiring = datum;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularTvShows() async {
    _popularMoviesState = RequestState.Loading;
    notifyListeners();

    final result = await _getPopularTvShows();
    result.fold(
      (failure) {
        _popularMoviesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (datum) {
        _popularMoviesState = RequestState.Loaded;
        _popular = datum;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedTvShows() async {
    _topRatedMoviesState = RequestState.Loading;
    notifyListeners();

    final result = await _getTopRatedTvShows();
    result.fold(
      (failure) {
        _topRatedMoviesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (datum) {
        _topRatedMoviesState = RequestState.Loaded;
        _topRated = datum;
        notifyListeners();
      },
    );
  }
}
