import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/home_page.dart';
import 'package:ditonton/presentation/pages/tv_show_detail_page.dart';
import 'package:ditonton/presentation/pages/watchlist_page.dart';
import 'package:ditonton/presentation/provider/movie_detail_notifier.dart';
import 'package:ditonton/presentation/provider/movie_list_notifier.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_detail_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/now_airing_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/popular_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/top_rated_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/pages/movie_detail_page.dart';
import 'presentation/provider/movie_list/popular_movies_notifier.dart';
import 'presentation/provider/movie_list/top_rated_movies_notifier.dart';

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
          create: (_) => di.locator<MovieListNotifier>()
            ..fetchNowPlayingMovies()
            ..fetchPopularMovies()
            ..fetchTopRatedMovies(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<SearchMovieNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider<MovieDetailNotifier>(
          create: (_) => di.locator(),
        ),
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
              switch (settings.name) {
                case HomePage.routeName:
                  return MaterialPageRoute(builder: (_) => HomePage());
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
                case MovieDetailPage.routeName:
                  final id = settings.arguments as int;
                  return MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider(
                      create: (_) => di.locator<MovieDetailNotifier>()
                        ..fetchMovieDetail(id)
                        ..loadWatchlistStatus(id),
                      builder: (_, __) => MovieDetailPage(id: id),
                    ),
                    settings: settings,
                  );
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
            },
          );
        },
      ),
    );
  }
}
