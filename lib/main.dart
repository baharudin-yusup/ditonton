import 'package:core/core.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/home_page.dart';
import 'package:ditonton/presentation/pages/tv_show_detail_page.dart';
import 'package:ditonton/presentation/pages/watchlist_page.dart';
import 'package:ditonton/presentation/provider/tv_show_detail_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/now_airing_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/popular_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/top_rated_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';
import 'package:movie/presentation/blocs/movie_watchlist_status/movie_watchlist_status_bloc.dart';
import 'package:movie/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistNotifier>(),
        ),
        ChangeNotifierProvider<TvShowListNotifier>(
          create: (_) => di.locator()
            ..fetchNowAiringTvShows()
            ..fetchPopularTvShows()
            ..fetchTopRatedTvShows(),
        ),
        ChangeNotifierProvider<NowAiringTvShowsNotifier>(
          create: (_) => di.locator(),
        ),
        ChangeNotifierProvider<PopularTvShowsNotifier>(
          create: (_) => di.locator(),
        ),
        ChangeNotifierProvider<TopRatedTvShowsNotifier>(
          create: (_) => di.locator(),
        ),
        BlocProvider<MovieWatchlistBloc>(
            create: (_) =>
                locator()..add(MovieWatchlistEvent.fetchDataStarted())),
      ],
      child: DynamicColorBuilder(
        builder: (lightColorScheme, darkColorScheme) {
          final defaultTheme = ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: kColorScheme,
            primaryColor: kRichBlack,
            scaffoldBackgroundColor: kRichBlack,
          );

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Ditonton',
            theme: lightColorScheme != null
                ? ThemeData.from(
                    colorScheme: lightColorScheme,
                    useMaterial3: true,
                  )
                : defaultTheme,
            darkTheme: darkColorScheme != null
                ? ThemeData.from(
                    colorScheme: darkColorScheme,
                    useMaterial3: true,
                  )
                : defaultTheme,
            navigatorObservers: [routeObserver],
            onGenerateRoute: (RouteSettings settings) {
              late final Widget page;
              switch (settings.name) {
                case HomePage.routeName:
                  page = MultiBlocProvider(
                    providers: [
                      /// Movie tab
                      BlocProvider<NowPlayingMoviesBloc>(
                          create: (_) => locator()
                            ..add(NowPlatingMoviesEvent.fetchDataStarted())),
                      BlocProvider<PopularMoviesBloc>(
                          create: (_) => locator()
                            ..add(PopularMoviesEvent.fetchDataStarted())),
                      BlocProvider<TopRatedMoviesBloc>(
                          create: (_) => locator()
                            ..add(TopRatedMoviesEvent.fetchDataStarted())),
                    ],
                    child: HomePage(),
                  );
                  break;
                case TvShowDetailPage.routeName:
                  final id = settings.arguments as int;
                  return MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider(
                      create: (_) => di.locator<TvShowDetailNotifier>()
                        ..setId(id)
                        ..fetchDetail()
                        ..loadWatchlistStatus(),
                      builder: (_, __) => TvShowDetailPage(id: id),
                    ),
                    settings: settings,
                  );

                /// Movie module routes
                case MovieDetailPage.routeName:
                  final id = settings.arguments as int;
                  page = MultiBlocProvider(
                      providers: [
                        BlocProvider<MovieDetailBloc>(
                            create: (_) => locator()
                              ..add(MovieDetailEvent.fetchDataStarted(
                                  movieId: id))),
                        BlocProvider<MovieRecommendationsBloc>(
                            create: (_) => locator()
                              ..add(MovieRecommendationsEvent.fetchDataStarted(
                                  movieId: id))),
                        BlocProvider<MovieWatchlistStatusBloc>(
                            create: (_) => locator()
                              ..add(MovieWatchlistStatusEvent.fetchDataStarted(
                                  id))),
                      ],
                      child: MovieDetailPage(
                        id: id,
                      ));
                  break;
                case MovieRecommendationsPage.routeName:
                  final movieId = settings.arguments as int;
                  page = BlocProvider<MovieRecommendationsBloc>(
                    create: (_) => locator()
                      ..add(MovieRecommendationsEvent.fetchDataStarted(
                          movieId: movieId)),
                    child: MovieRecommendationsPage(movieId),
                  );
                  break;
                case NowPlayingMoviesPage.routeName:
                  page = BlocProvider<NowPlayingMoviesBloc>(
                    create: (_) => locator()
                      ..add(NowPlatingMoviesEvent.fetchDataStarted()),
                    child: NowPlayingMoviesPage(),
                  );
                  break;
                case PopularMoviesPage.routeName:
                  page = BlocProvider<PopularMoviesBloc>(
                    create: (_) =>
                        locator()..add(PopularMoviesEvent.fetchDataStarted()),
                    child: PopularMoviesPage(),
                  );
                  break;
                case SearchMoviesPage.routeName:
                  page = BlocProvider<SearchMoviesBloc>(
                    create: (_) => locator(),
                    child: SearchMoviesPage(),
                  );
                  break;
                case TopRatedMoviesPage.routeName:
                  page = BlocProvider<TopRatedMoviesBloc>(
                    create: (_) =>
                        locator()..add(TopRatedMoviesEvent.fetchDataStarted()),
                    child: TopRatedMoviesPage(),
                  );
                  break;
                case WatchlistPage.ROUTE_NAME:
                  return MaterialPageRoute(builder: (_) => WatchlistPage());
                case AboutPage.ROUTE_NAME:
                  return MaterialPageRoute(builder: (_) => AboutPage());
                default:
                  return MaterialPageRoute(builder: (_) {
                    return Scaffold(
                      body: Center(
                        child: Text('Page not found :('),
                      ),
                    );
                  });
              }
              return MaterialPageRoute(builder: (_) => page);
            },
          );
        },
      ),
    );
  }
}
