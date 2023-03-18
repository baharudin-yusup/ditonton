import 'package:core/init.dart' show locator;
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
        child: TvShowDetailPage(
          id,
          key: const Key(TvShowDetailPage.routeName),
        ),
      );
    case TvShowRecommendationsPage.routeName:
      final id = settings.arguments as int;
      return BlocProvider<TvShowRecommendationsBloc>(
        create: (_) =>
            locator()..add(TvShowRecommendationsEvent.fetchDataStarted(id)),
        child: TvShowRecommendationsPage(
          id,
          key: const Key(TvShowRecommendationsPage.routeName),
        ),
      );
    case NowAiringTvShowsPage.routeName:
      return BlocProvider<NowAiringTvShowsBloc>(
        create: (_) =>
            locator()..add(const NowAiringTvShowsEvent.fetchDataStarted()),
        child: const NowAiringTvShowsPage(
          key: Key(NowAiringTvShowsPage.routeName),
        ),
      );
    case PopularTvShowsPage.routeName:
      return BlocProvider<PopularTvShowsBloc>(
        create: (_) =>
            locator()..add(const PopularTvShowsEvent.fetchDataStarted()),
        child: const PopularTvShowsPage(
          key: Key(PopularTvShowsPage.routeName),
        ),
      );
    case SearchTvShowsPage.routeName:
      return BlocProvider<SearchTvShowsBloc>(
        create: (_) => locator(),
        child: SearchTvShowsPage(
          key: const Key(SearchTvShowsPage.routeName),
        ),
      );
    case TopRatedTvShowsPage.routeName:
      return BlocProvider<TopRatedTvShowsBloc>(
        create: (_) =>
            locator()..add(const TopRatedTvShowsEvent.fetchDataStarted()),
        child: const TopRatedTvShowsPage(
          key: Key(TopRatedTvShowsPage.routeName),
        ),
      );
    default:
      return null;
  }
}
