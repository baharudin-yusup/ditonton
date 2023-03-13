import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/entertainment_list_page.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/provider/tv_show_list/now_airing_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/popular_tv_shows_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list/search_tv_show_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list_notifier.dart';
import 'package:ditonton/presentation/widgets/base/home_subheading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/tv_show_list/top_rated_tv_shows_notifier.dart';
import '../widgets/entertainment_horizontal_list.dart';

class TvShowDashboardPage extends StatelessWidget {
  const TvShowDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Shows'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, SearchPage.route<SearchTvShowNotifier>());
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
                title: 'Now Airing',
                onSeeMorePressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          EntertainmentListPage<NowAiringTvShowsNotifier>(
                              title: 'Now Airing TV Shows'),
                    ),
                  );
                },
              )),
      Consumer<TvShowListNotifier>(builder: (context, data, child) {
        final datum = data.nowPlaying;
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
                          EntertainmentListPage<PopularTvShowsNotifier>(
                              title: 'Popular TV Shows'),
                    ),
                  );
                },
              )),
      Consumer<TvShowListNotifier>(builder: (context, data, child) {
        final datum = data.popular;
        final state = data.popularState;
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
                      builder: (_) =>
                          EntertainmentListPage<TopRatedTvShowsNotifier>(
                              title: 'Top Rated TV Shows'),
                    ),
                  );
                },
              )),
      Consumer<TvShowListNotifier>(builder: (context, data, child) {
        final datum = data.topRated;
        final state = data.topRatedState;
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
