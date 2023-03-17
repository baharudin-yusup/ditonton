import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/popular_tv_shows/popular_tv_shows_bloc.dart';
import 'tv_show_detail_page.dart';

class PopularTvShowsPage extends EntertainmentListPage {
  static const routeName = '/popular-tv-shows';

  const PopularTvShowsPage({super.key}) : super(title: 'Popular TV Shows');

  @override
  Widget buildBody() {
    return BlocBuilder<PopularTvShowsBloc, PopularTvShowsState>(
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
    Navigator.pushNamed(context, TvShowDetailPage.routeName,
        arguments: data.id);
  }
}
