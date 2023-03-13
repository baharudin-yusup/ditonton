import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/entertainment_list_page.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/provider/movie_list/now_playing_movies_notifier.dart';
import 'package:ditonton/presentation/provider/movie_list/popular_movies_notifier.dart';
import 'package:ditonton/presentation/provider/movie_list/top_rated_movies_notifier.dart';
import 'package:ditonton/presentation/provider/movie_list_notifier.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton/presentation/widgets/base/home_subheading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/entertainment_horizontal_list.dart';

class MovieDashboardPage extends StatelessWidget {
  const MovieDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(
            key: kSearchButtonKey,
            onPressed: () {
              Navigator.push(context, SearchPage.route<SearchMovieNotifier>());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(vertical: NavigationToolbar.kMiddleSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...buildNowAiringTvShows(),
            ...buildPopularTvShows(),
            ...buildTopRatedTvShows(),
          ],
        ),
      ),
    );
  }

  List<Widget> buildNowAiringTvShows() {
    return [
      Builder(
          builder: (context) => HomeSubheading(
                title: 'Now Playing',
                onSeeMorePressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          EntertainmentListPage<NowPlayingMoviesNotifier>(
                              title: 'Now Playing Movies'),
                    ),
                  );
                },
              )),
      Consumer<MovieListNotifier>(builder: (context, data, child) {
        final datum = data.nowPlayingMovies;
        final state = data.nowPlayingState;
        switch (state) {
          case RequestState.Loading:
          case RequestState.Loaded:
            return EntertainmentHorizontalList(datum, state);
          default:
            return Text('Failed');
        }
      }),
    ];
  }

  List<Widget> buildPopularTvShows() {
    return [
      Builder(
          builder: (context) => HomeSubheading(
                title: 'Popular',
                onSeeMorePressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          EntertainmentListPage<PopularMoviesNotifier>(
                              title: 'Popular Movies'),
                    ),
                  );
                },
              )),
      Consumer<MovieListNotifier>(builder: (context, data, child) {
        final datum = data.popularMovies;
        final state = data.popularMoviesState;
        switch (state) {
          case RequestState.Loading:
          case RequestState.Loaded:
            return EntertainmentHorizontalList(datum, state);
          default:
            return Text('Failed');
        }
      }),
    ];
  }

  List<Widget> buildTopRatedTvShows() {
    return [
      Builder(
        builder: (context) => HomeSubheading(
          title: 'Top Rated',
          onSeeMorePressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EntertainmentListPage<TopRatedMoviesNotifier>(
                    title: 'Top Rated Movies'),
              ),
            );
          },
        ),
      ),
      Consumer<MovieListNotifier>(builder: (context, data, child) {
        final datum = data.topRatedMovies;
        final state = data.topRatedMoviesState;
        switch (state) {
          case RequestState.Loading:
          case RequestState.Loaded:
            return EntertainmentHorizontalList(datum, state);
          default:
            return Text('Failed');
        }
      }),
    ];
  }
}
