import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../movie.dart';

class MovieDashboardPage extends StatelessWidget {
  const MovieDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          IconButton(
            key: kSearchButtonKey,
            onPressed: () {
              Navigator.pushNamed(context, SearchMoviesPage.routeName);
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
            showNowPlayingMovies(),
            showPopularMovies(),
            showTopRatedMovies(),
          ],
        ),
      ),
    );
  }

  Widget showNowPlayingMovies() {
    return BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
        builder: (context, state) {
      return Column(
        children: [
          HomeSubheading(
            title: 'Now Playing',
            onSeeMorePressed: () =>
                Navigator.pushNamed(context, NowPlayingMoviesPage.routeName),
          ),
          state.when(
            initial: (_) => showLoading(),
            fetchDataInProgress: (_) => showLoading(),
            fetchDataSuccess: (movies, _) => EntertainmentHorizontalList(
              movies,
              onTap: (movie) => Navigator.pushNamed(
                  context, MovieDetailPage.routeName,
                  arguments: movie.id),
            ),
            fetchDataFailure: (message, _) => showFailureMessage(message),
          ),
        ],
      );
    });
  }

  Widget showPopularMovies() {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
        builder: (context, state) {
      return Column(
        children: [
          HomeSubheading(
            title: 'Popular Movies',
            onSeeMorePressed: () =>
                Navigator.pushNamed(context, PopularMoviesPage.routeName),
          ),
          state.when(
            initial: (_) => showLoading(),
            fetchDataInProgress: (_) => showLoading(),
            fetchDataSuccess: (movies, _) => EntertainmentHorizontalList(
              movies,
              onTap: (movie) => Navigator.pushNamed(
                  context, MovieDetailPage.routeName,
                  arguments: movie.id),
            ),
            fetchDataFailure: (message, _) => showFailureMessage(message),
          ),
        ],
      );
    });
  }

  Widget showTopRatedMovies() {
    return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
        builder: (context, state) {
      return Column(
        children: [
          HomeSubheading(
            title: 'Top Rated Movies',
            onSeeMorePressed: () =>
                Navigator.pushNamed(context, TopRatedMoviesPage.routeName),
          ),
          state.when(
            initial: (_) => showLoading(),
            fetchDataInProgress: (_) => showLoading(),
            fetchDataSuccess: (movies, _) => EntertainmentHorizontalList(
              movies,
              onTap: (movie) => Navigator.pushNamed(
                  context, MovieDetailPage.routeName,
                  arguments: movie.id),
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
