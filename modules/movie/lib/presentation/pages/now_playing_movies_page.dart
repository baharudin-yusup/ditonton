import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../movie.dart';

class NowPlayingMoviesPage extends EntertainmentListPage {
  static const routeName = '/now-playing-movies';

  const NowPlayingMoviesPage({super.key}) : super(title: 'Now Playing Movies');

  @override
  Widget buildBody() {
    return BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => showInitialState(),
          fetchDataInProgress: (_) => showLoading(),
          fetchDataSuccess: (data) => showContents(data.movies),
          fetchDataFailure: (data) => showErrorMessage(data.message),
        );
      },
    );
  }

  @override
  void onCardTapped(BuildContext context, Watchlist data) {
    Navigator.pushNamed(context, MovieDetailPage.routeName, arguments: data.id);
  }
}
