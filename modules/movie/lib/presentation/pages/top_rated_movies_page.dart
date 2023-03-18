import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../movie.dart';

class TopRatedMoviesPage extends EntertainmentListPage {
  static const routeName = '/top-rated-movies';

  const TopRatedMoviesPage({super.key}) : super(title: 'Top Rated Movies');

  @override
  Widget buildBody() {
    return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
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
