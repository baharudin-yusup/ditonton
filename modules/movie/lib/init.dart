library init;

import 'package:core/core.dart';

import 'movie.dart';

// coverage:ignore-start
void initLocator() {
  /// Blocs
  locator.registerFactory(() => MovieRecommendationsBloc(locator()));
  locator.registerFactory(() => NowPlayingMoviesBloc(locator()));
  locator.registerFactory(() => PopularMoviesBloc(locator()));
  locator.registerFactory(() => TopRatedMoviesBloc(locator()));
  locator.registerFactory(() => MovieDetailBloc(locator()));
  locator.registerFactory(() =>
      MovieWatchlistStatusBloc(locator(), locator(), locator(), locator()));
  locator.registerFactory(() => SearchMoviesBloc(locator()));
  locator.registerLazySingleton(() => MovieWatchlistBloc(locator()));

  /// Usecases
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => GetMovieWatchlist(locator()));
  locator.registerLazySingleton(() => GetMovieWatchlistStatus(locator()));
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => RemoveMovieWatchlist(locator()));
  locator.registerLazySingleton(() => SaveMovieWatchlist(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));

  /// Repository
  locator.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(locator(), locator()));

  /// Data sources
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(locator()));
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(locator()));
}
// coverage:ignore-end
