import 'package:core/init.dart';
import 'package:ditonton/presentation/pages/pages.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/blocs/blocs.dart';
import 'package:tv_show/presentation/blocs/blocs.dart';

Widget getGeneralPage(RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return MultiBlocProvider(
        providers: [
          /// Movie Bloc
          BlocProvider<NowPlayingMoviesBloc>(
              create: (_) =>
                  locator()..add(NowPlayingMoviesEvent.fetchDataStarted())),
          BlocProvider<PopularMoviesBloc>(
              create: (_) =>
                  locator()..add(PopularMoviesEvent.fetchDataStarted())),
          BlocProvider<TopRatedMoviesBloc>(
              create: (_) =>
                  locator()..add(TopRatedMoviesEvent.fetchDataStarted())),

          /// TV Show Bloc
          BlocProvider<NowAiringTvShowsBloc>(
              create: (_) =>
                  locator()..add(NowAiringTvShowsEvent.fetchDataStarted())),
          BlocProvider<PopularTvShowsBloc>(
              create: (_) =>
                  locator()..add(PopularTvShowsEvent.fetchDataStarted())),
          BlocProvider<TopRatedTvShowsBloc>(
              create: (_) =>
                  locator()..add(TopRatedTvShowsEvent.fetchDataStarted())),
        ],
        child: HomePage(),
      );
    default:
      return UnknownPage();
  }
}
