import 'package:core/presentation/widgets/entertainment_horizontal_list.dart';
import 'package:core/presentation/widgets/home_subheading.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_show_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              // TODO: Implement this
              // Navigator.push(context, SearchPage.route<SearchTvShowNotifier>());
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
                  // TODO: Implement this
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) =>
                  //         EntertainmentListPage<NowAiringTvShowsNotifier>(
                  //             title: 'Now Airing TV Shows'),
                  //   ),
                  // );
                },
              )),
      Consumer<TvShowListNotifier>(builder: (context, data, child) {
        final datum = data.nowPlaying;
        final state = data.nowPlayingState;
        switch (state) {
          case RequestState.Loading:
          case RequestState.Loaded:
            // TODO: Implement this

            return EntertainmentHorizontalList(datum);
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
                  // TODO: Implement this
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) =>
                  //         EntertainmentListPage<PopularTvShowsNotifier>(
                  //             title: 'Popular TV Shows'),
                  //   ),
                  // );
                },
              )),
      Consumer<TvShowListNotifier>(builder: (context, data, child) {
        final datum = data.popular;
        final state = data.popularState;
        switch (state) {
          case RequestState.Loading:
          case RequestState.Loaded:
            return EntertainmentHorizontalList(datum);
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
                  // TODO: Implement this
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) =>
                  //         EntertainmentListPage<TopRatedTvShowsNotifier>(
                  //             title: 'Top Rated TV Shows'),
                  //   ),
                  // );
                },
              )),
      Consumer<TvShowListNotifier>(builder: (context, data, child) {
        final datum = data.topRated;
        final state = data.topRatedState;
        switch (state) {
          case RequestState.Loading:
          case RequestState.Loaded:
            return EntertainmentHorizontalList(datum);
          default:
            return Text('Failed');
        }
      }),
    ];
  }
}
