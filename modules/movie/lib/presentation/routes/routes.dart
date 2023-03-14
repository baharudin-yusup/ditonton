import 'package:core/core.dart';
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
            id: id,
          ));
    case MovieRecommendationsPage.routeName:
      final movieId = settings.arguments as int;
      return BlocProvider<MovieRecommendationsBloc>(
        create: (_) => locator()
          ..add(MovieRecommendationsEvent.fetchDataStarted(movieId: movieId)),
        child: MovieRecommendationsPage(movieId),
      );
    case NowPlayingMoviesPage.routeName:
      return BlocProvider<NowPlayingMoviesBloc>(
        create: (_) =>
            locator()..add(const NowPlayingMoviesEvent.fetchDataStarted()),
        child: const NowPlayingMoviesPage(),
      );
    case PopularMoviesPage.routeName:
      return BlocProvider<PopularMoviesBloc>(
        create: (_) =>
            locator()..add(const PopularMoviesEvent.fetchDataStarted()),
        child: const PopularMoviesPage(),
      );
    case SearchMoviesPage.routeName:
      return BlocProvider<SearchMoviesBloc>(
        create: (_) => locator(),
        child: SearchMoviesPage(),
      );
    case TopRatedMoviesPage.routeName:
      return BlocProvider<TopRatedMoviesBloc>(
        create: (_) =>
            locator()..add(const TopRatedMoviesEvent.fetchDataStarted()),
        child: const TopRatedMoviesPage(),
      );
    default:
      return null;
  }
}
