import 'package:core/init.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../pages/pages.dart';

Widget? getTvShowPage(RouteSettings settings) {
  switch (settings.name) {
    case TvShowDetailPage.routeName:
      final id = settings.arguments as int;
      return MultiBlocProvider(
        providers: [
          BlocProvider<TvShowDetailBloc>(
              create: (_) =>
                  locator()..add(TvShowDetailEvent.fetchDataStarted(id))),
          BlocProvider<TvShowRecommendationsBloc>(
              create: (_) => locator()
                ..add(TvShowRecommendationsEvent.fetchDataStarted(id))),
          BlocProvider<TvShowWatchlistStatusBloc>(
              create: (_) => locator()
                ..add(TvShowWatchlistStatusEvent.fetchDataStarted(id))),
        ],
        child: TvShowDetailPage(id),
      );
    case TvShowRecommendationsPage.routeName:
      final id = settings.arguments as int;
      return BlocProvider<TvShowRecommendationsBloc>(
        create: (_) =>
            locator()..add(TvShowRecommendationsEvent.fetchDataStarted(id)),
        child: TvShowRecommendationsPage(id),
      );
      break;
    case NowAiringTvShowsPage.routeName:
      return BlocProvider<NowAiringTvShowsBloc>(
        create: (_) =>
            locator()..add(const NowAiringTvShowsEvent.fetchDataStarted()),
        child: const NowAiringTvShowsPage(),
      );
    case PopularTvShowsPage.routeName:
      return BlocProvider<PopularTvShowsBloc>(
        create: (_) =>
            locator()..add(const PopularTvShowsEvent.fetchDataStarted()),
        child: const PopularTvShowsPage(),
      );
    case SearchTvShowsPage.routeName:
      return BlocProvider<SearchTvShowsBloc>(
        create: (_) => locator(),
        child: SearchTvShowsPage(),
      );
    case TopRatedTvShowsPage.routeName:
      return BlocProvider<TopRatedTvShowsBloc>(
        create: (_) =>
            locator()..add(const TopRatedTvShowsEvent.fetchDataStarted()),
        child: const TopRatedTvShowsPage(),
      );
    default:
      return null;
  }
}
