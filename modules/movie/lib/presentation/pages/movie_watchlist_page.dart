import 'package:core/core.dart';
import 'package:core/presentation/pages/raw_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/movie_watchlist/movie_watchlist_bloc.dart';
import 'movie_detail_page.dart';

class MovieWatchlistPage extends RawListPage {
  const MovieWatchlistPage({super.key});

  @override
  Widget buildBody() {
    return BlocBuilder<MovieWatchlistBloc, MovieWatchlistState>(
      builder: (context, state) {
        return state.when(
          initial: () => showInitialState(),
          fetchDataInProgress: () => showLoading(),
          fetchDataSuccess: (data) =>
              data.isNotEmpty ? showContents(data) : showEmptyContent(),
          fetchDataFailure: (message) => showErrorMessage(message),
        );
      },
    );
  }

  @override
  void onCardTapped(BuildContext context, Watchlist data) {
    Navigator.pushNamed(context, MovieDetailPage.routeName, arguments: data.id);
  }
}
