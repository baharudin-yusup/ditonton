library init;

import 'package:core/core.dart';

import 'data/repositories/repositories.dart';
import 'data/sources/sources.dart';
import 'domain/repositories/repositories.dart';
import 'domain/usecases/usecases.dart';
import 'presentation/blocs/blocs.dart';

void initLocator() {
  /// Blocs
  locator.registerFactory(() => TvShowRecommendationsBloc(locator()));
  locator.registerFactory(() => NowAiringTvShowsBloc(locator()));
  locator.registerFactory(() => PopularTvShowsBloc(locator()));
  locator.registerFactory(() => TopRatedTvShowsBloc(locator()));
  locator.registerFactory(() => TvShowDetailBloc(locator()));
  locator.registerFactory(() =>
      TvShowWatchlistStatusBloc(locator(), locator(), locator(), locator()));
  locator.registerFactory(() => SearchTvShowsBloc(locator()));
  locator.registerLazySingleton(() => TvShowWatchlistBloc(locator()));

  /// Usecases
  locator.registerLazySingleton(() => GetTvShowDetail(locator()));
  locator.registerLazySingleton(() => GetTvShowRecommendations(locator()));
  locator.registerLazySingleton(() => GetTvShowWatchlist(locator()));
  locator.registerLazySingleton(() => GetTvShowWatchListStatus(locator()));
  locator.registerLazySingleton(() => GetNowAiringTvShows(locator()));
  locator.registerLazySingleton(() => GetPopularTvShows(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvShows(locator()));
  locator.registerLazySingleton(() => RemoveTvShowWatchlist(locator()));
  locator.registerLazySingleton(() => SaveTvShowWatchlist(locator()));
  locator.registerLazySingleton(() => SearchTvShows(locator()));

  /// Repository
  locator.registerLazySingleton<TvShowRepository>(
      () => TvShowRepositoryImpl(locator(), locator()));

  /// Data sources
  locator.registerLazySingleton<TvShowLocalDataSource>(
      () => TvShowLocalDataSourceImpl(locator()));
  locator.registerLazySingleton<TvShowRemoteDataSource>(
      () => TvShowRemoteDataSourceImpl(locator()));
}
