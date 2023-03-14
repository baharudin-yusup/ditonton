// import 'package:ditonton/common/state_enum.dart';
// import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
// import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../core/lib/domain/entities/watchlist.dart';
// import '../../domain/entities/movie.dart';
// import '../../domain/usecases/get_popular_movies.dart';
//
// class MovieListNotifier extends ChangeNotifier {
//   var _nowPlayingMovies = <Movie>[];
//
//   List<Watchlist> get nowPlayingMovies =>
//       _nowPlayingMovies.map((data) => data.toWatchlist()).toList();
//
//   RequestState _nowPlayingState = RequestState.Empty;
//
//   RequestState get nowPlayingState => _nowPlayingState;
//
//   var _popularMovies = <Movie>[];
//
//   List<Watchlist> get popularMovies =>
//       _popularMovies.map((data) => data.toWatchlist()).toList();
//
//   RequestState _popularMoviesState = RequestState.Empty;
//
//   RequestState get popularMoviesState => _popularMoviesState;
//
//   var _topRatedMovies = <Movie>[];
//
//   List<Watchlist> get topRatedMovies =>
//       _topRatedMovies.map((data) => data.toWatchlist()).toList();
//
//   RequestState _topRatedMoviesState = RequestState.Empty;
//
//   RequestState get topRatedMoviesState => _topRatedMoviesState;
//
//   String _message = '';
//
//   String get message => _message;
//
//   MovieListNotifier(
//     this.getNowPlayingMovies,
//     this.getPopularMovies,
//     this.getTopRatedMovies,
//   );
//
//   final GetNowPlayingMovies getNowPlayingMovies;
//   final GetPopularMovies getPopularMovies;
//   final GetTopRatedMovies getTopRatedMovies;
//
//   Future<void> fetchNowPlayingMovies() async {
//     _nowPlayingState = RequestState.Loading;
//     notifyListeners();
//
//     final result = await getNowPlayingMovies();
//     result.fold(
//       (failure) {
//         _nowPlayingState = RequestState.Error;
//         _message = failure.message;
//         notifyListeners();
//       },
//       (moviesData) {
//         _nowPlayingState = RequestState.Loaded;
//         _nowPlayingMovies = moviesData;
//         notifyListeners();
//       },
//     );
//   }
//
//   Future<void> fetchPopularMovies() async {
//     _popularMoviesState = RequestState.Loading;
//     notifyListeners();
//
//     final result = await getPopularMovies();
//     result.fold(
//       (failure) {
//         _popularMoviesState = RequestState.Error;
//         _message = failure.message;
//         notifyListeners();
//       },
//       (moviesData) {
//         _popularMoviesState = RequestState.Loaded;
//         _popularMovies = moviesData;
//         notifyListeners();
//       },
//     );
//   }
//
//   Future<void> fetchTopRatedMovies() async {
//     _topRatedMoviesState = RequestState.Loading;
//     notifyListeners();
//
//     final result = await getTopRatedMovies();
//     result.fold(
//       (failure) {
//         _topRatedMoviesState = RequestState.Error;
//         _message = failure.message;
//         notifyListeners();
//       },
//       (moviesData) {
//         _topRatedMoviesState = RequestState.Loaded;
//         _topRatedMovies = moviesData;
//         notifyListeners();
//       },
//     );
//   }
// }
