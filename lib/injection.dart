import 'package:ditonton/data/datasources/database_helper.dart';
import 'package:ditonton/data/datasources/movie_local_data_source.dart';
import 'package:ditonton/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton/data/datasources/tv_show_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_show_remote_data_source.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/data/repositories/tv_show_repository_impl.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_movie_watchlist.dart';
import 'package:ditonton/domain/usecases/get_movie_watchlist_status.dart';
import 'package:ditonton/domain/usecases/get_now_airing_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_tv_show_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_show_recommendations.dart';
import 'package:ditonton/domain/usecases/get_tv_show_watchlist.dart';
import 'package:ditonton/domain/usecases/get_tv_show_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_movie_watchlist.dart';
import 'package:ditonton/domain/usecases/remove_tv_show_watchlist.dart';
import 'package:ditonton/domain/usecases/save_movie_watchlist.dart';
import 'package:ditonton/domain/usecases/save_tv_show_watchlist.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/domain/usecases/search_tv_shows.dart';
import 'package:ditonton/presentation/provider/movie_detail_notifier.dart';
import 'package:ditonton/presentation/provider/movie_list/movie_recomendations_notifier.dart';
import 'package:ditonton/presentation/provider/movie_list/now_playing_movies_notifier.dart';
import 'package:ditonton/presentation/provider/movie_list_notifier.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_detail_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/now_airing_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/popular_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/search_tv_show_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/top_rated_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/tv_show_recommendations_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'presentation/provider/movie_list/popular_movies_notifier.dart';
import 'presentation/provider/movie_list/top_rated_movies_notifier.dart';

final locator = GetIt.instance;
var _isInitialized = false;

void init() {
  if (_isInitialized) {
    return;
  }
  // provider
  locator.registerFactory(
      () => MovieListNotifier(locator(), locator(), locator()));
  locator.registerFactory(() => NowPlayingMoviesNotifier(locator()));
  locator.registerFactory(() => PopularMoviesNotifier(locator()));
  locator.registerFactory(() => TopRatedMoviesNotifier(locator()));
  locator.registerFactory(() => MovieRecommendationsNotifier(locator()));
  locator.registerFactory(() => MovieDetailNotifier(
      locator(), locator(), locator(), locator(), locator()));
  locator.registerFactory(() => SearchMovieNotifier(searchMovies: locator()));
  locator.registerFactory(
    () => WatchlistNotifier(
        getWatchlistMovies: locator(), getTvShowWatchlist: locator()),
  );
  locator.registerLazySingleton(
      () => TvShowListNotifier(locator(), locator(), locator()));
  locator.registerFactory(() => NowAiringTvShowsNotifier(locator()));
  locator.registerFactory(() => PopularTvShowsNotifier(locator()));
  locator.registerFactory(() => TopRatedTvShowsNotifier(locator()));
  locator.registerFactory(() => TvShowRecommendationsNotifier(locator()));
  locator.registerFactory(() => SearchTvShowNotifier(locator()));
  locator.registerFactory(() => TvShowDetailNotifier(
      locator(), locator(), locator(), locator(), locator()));

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetMovieWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveMovieWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveMovieWatchlist(locator()));
  locator.registerLazySingleton(() => GetMovieWatchlist(locator()));

  locator.registerLazySingleton(() => GetNowAiringTvShows(locator()));
  locator.registerLazySingleton(() => GetPopularTvShows(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvShows(locator()));
  locator.registerLazySingleton(() => GetTvShowDetail(locator()));
  locator.registerLazySingleton(() => GetTvShowRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTvShows(locator()));
  locator.registerLazySingleton(() => GetTvShowWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveTvShowWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveTvShowWatchlist(locator()));
  locator.registerLazySingleton(() => GetTvShowWatchlist(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<TvShowRepository>(
      () => TvShowRepositoryImpl(locator(), locator()));

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TvShowRemoteDataSource>(
      () => TvShowRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvShowLocalDataSource>(
      () => TvShowLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());

  _isInitialized = true;
}
