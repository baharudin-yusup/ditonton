import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../movie.dart';

class PopularMoviesPage extends EntertainmentListPage {
  static const routeName = '/popular-movies';

  const PopularMoviesPage({super.key}) : super(title: 'Popular Movies');

  @override
  Widget buildBody() {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
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
