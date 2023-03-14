import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import 'now_airing_tv_shows_page.dart';
import 'popular_tv_shows_page.dart';
import 'search_tv_shows_page.dart';
import 'top_rated_tv_shows_page.dart';
import 'tv_show_detail_page.dart';

class TvShowDashboardPage extends StatelessWidget {
  const TvShowDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Shows'),
        actions: [
          IconButton(
            key: kSearchButtonKey,
            onPressed: () {
              Navigator.pushNamed(context, SearchTvShowsPage.routeName);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            vertical: NavigationToolbar.kMiddleSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            showNowAiringTvShows(),
            showPopularTvShows(),
            showTopRatedTvShows(),
          ],
        ),
      ),
    );
  }

  Widget showNowAiringTvShows() {
    return BlocBuilder<NowAiringTvShowsBloc, NowAiringTvShowsState>(
        builder: (context, state) {
      return Column(
        children: [
          HomeSubheading(
            title: 'Now Airing',
            onSeeMorePressed: () =>
                Navigator.pushNamed(context, NowAiringTvShowsPage.routeName),
          ),
          state.when(
            initial: (_) => showLoading(),
            fetchDataInProgress: (_) => showLoading(),
            fetchDataSuccess: (tvShows, _) => EntertainmentHorizontalList(
              tvShows,
              onTap: (tvShow) => Navigator.pushNamed(
                  context, TvShowDetailPage.routeName,
                  arguments: tvShow.id),
            ),
            fetchDataFailure: (message, _) => showFailureMessage(message),
          ),
        ],
      );
    });
  }

  Widget showPopularTvShows() {
    return BlocBuilder<PopularTvShowsBloc, PopularTvShowsState>(
        builder: (context, state) {
      return Column(
        children: [
          HomeSubheading(
            title: 'Popular',
            onSeeMorePressed: () =>
                Navigator.pushNamed(context, PopularTvShowsPage.routeName),
          ),
          state.when(
            initial: (_) => showLoading(),
            fetchDataInProgress: (_) => showLoading(),
            fetchDataSuccess: (tvShows, _) => EntertainmentHorizontalList(
              tvShows,
              onTap: (tvShow) => Navigator.pushNamed(
                  context, TvShowDetailPage.routeName,
                  arguments: tvShow.id),
            ),
            fetchDataFailure: (message, _) => showFailureMessage(message),
          ),
        ],
      );
    });
  }

  Widget showTopRatedTvShows() {
    return BlocBuilder<TopRatedTvShowsBloc, TopRatedTvShowsState>(
        builder: (context, state) {
      return Column(
        children: [
          HomeSubheading(
            title: 'Top Rated',
            onSeeMorePressed: () =>
                Navigator.pushNamed(context, TopRatedTvShowsPage.routeName),
          ),
          state.when(
            initial: (_) => showLoading(),
            fetchDataInProgress: (_) => showLoading(),
            fetchDataSuccess: (tvShows, _) => EntertainmentHorizontalList(
              tvShows,
              onTap: (tvShow) => Navigator.pushNamed(
                  context, TvShowDetailPage.routeName,
                  arguments: tvShow.id),
            ),
            fetchDataFailure: (message, _) => showFailureMessage(message),
          ),
        ],
      );
    });
  }

  Widget showLoading() {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 25,
          width: constraints.maxWidth,
          alignment: Alignment.topCenter,
          child: const CircularProgressIndicator.adaptive(),
        ),
      );
    });
  }

  Widget showFailureMessage(String message) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: constraints.maxWidth,
          alignment: Alignment.topCenter,
          child: Text(message),
        ),
      );
    });
  }
}
