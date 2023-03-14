import 'package:core/init.dart' as core;
import 'package:ditonton/data/datasources/tv_show_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_show_remote_data_source.dart';
import 'package:ditonton/data/repositories/tv_show_repository_impl.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:ditonton/domain/usecases/get_now_airing_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_tv_show_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_show_recommendations.dart';
import 'package:ditonton/domain/usecases/get_tv_show_watchlist.dart';
import 'package:ditonton/domain/usecases/get_tv_show_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_tv_show_watchlist.dart';
import 'package:ditonton/domain/usecases/save_tv_show_watchlist.dart';
import 'package:ditonton/domain/usecases/search_tv_shows.dart';
import 'package:ditonton/presentation/provider/tv_show_detail_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/now_airing_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/popular_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/search_tv_show_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/top_rated_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/tv_show_recommendations_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/init.dart' as movie;

final locator = GetIt.instance;
var _isInitialized = false;

void init() {
  if (_isInitialized) {
    return;
  }

  core.initLocator();
  movie.initLocator();

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
  locator.registerLazySingleton<TvShowRepository>(
      () => TvShowRepositoryImpl(locator(), locator()));

  // data sources
  locator.registerLazySingleton<TvShowRemoteDataSource>(
      () => TvShowRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvShowLocalDataSource>(
      () => TvShowLocalDataSourceImpl(databaseHelper: locator()));

  _isInitialized = true;
}
