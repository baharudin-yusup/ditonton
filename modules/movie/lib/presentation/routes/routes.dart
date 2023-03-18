import 'package:core/init.dart' show locator;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../pages/pages.dart';

Widget? getMoviePage(RouteSettings settings) {
  switch (settings.name) {
    case MovieDetailPage.routeName:
      final id = settings.arguments as int;
      return MultiBlocProvider(
          providers: [
            BlocProvider<MovieDetailBloc>(
                create: (_) => locator()
                  ..add(MovieDetailEvent.fetchDataStarted(movieId: id))),
            BlocProvider<MovieRecommendationsBloc>(
                create: (_) => locator()
                  ..add(
                      MovieRecommendationsEvent.fetchDataStarted(movieId: id))),
            BlocProvider<MovieWatchlistStatusBloc>(
                create: (_) => locator()
                  ..add(MovieWatchlistStatusEvent.fetchDataStarted(id))),
          ],
          child: MovieDetailPage(
            key: const Key(MovieDetailPage.routeName),
            id: id,
          ));
    case MovieRecommendationsPage.routeName:
      final movieId = settings.arguments as int;
      return BlocProvider<MovieRecommendationsBloc>(
        create: (_) => locator()
          ..add(MovieRecommendationsEvent.fetchDataStarted(movieId: movieId)),
        child: MovieRecommendationsPage(
          movieId,
          key: const Key(MovieRecommendationsPage.routeName),
        ),
      );
    case NowPlayingMoviesPage.routeName:
      return BlocProvider<NowPlayingMoviesBloc>(
        create: (_) =>
            locator()..add(const NowPlayingMoviesEvent.fetchDataStarted()),
        child: const NowPlayingMoviesPage(
          key: Key(NowPlayingMoviesPage.routeName),
        ),
      );
    case PopularMoviesPage.routeName:
      return BlocProvider<PopularMoviesBloc>(
        create: (_) =>
            locator()..add(const PopularMoviesEvent.fetchDataStarted()),
        child: const PopularMoviesPage(
          key: Key(PopularMoviesPage.routeName),
        ),
      );
    case SearchMoviesPage.routeName:
      return BlocProvider<SearchMoviesBloc>(
        create: (_) => locator(),
        child: SearchMoviesPage(
          key: const Key(SearchMoviesPage.routeName),
        ),
      );
    case TopRatedMoviesPage.routeName:
      return BlocProvider<TopRatedMoviesBloc>(
        create: (_) =>
            locator()..add(const TopRatedMoviesEvent.fetchDataStarted()),
        child: const TopRatedMoviesPage(
          key: Key(TopRatedMoviesPage.routeName),
        ),
      );
    default:
      return null;
  }
}
