import 'package:core/core.dart';
import 'package:core/presentation/pages/raw_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../movie.dart';
import '../blocs/movie_watchlist/movie_watchlist_bloc.dart';

class MovieWatchlistPage extends RawListPage {
  const MovieWatchlistPage({super.key});

  @override
  Widget buildBody() {
    return BlocBuilder<MovieWatchlistBloc, MovieWatchlistState>(
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
