import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import 'tv_show_detail_page.dart';

class NowAiringTvShowsPage extends EntertainmentListPage {
  static const routeName = '/now-airing-tv-shows';

  const NowAiringTvShowsPage({super.key}) : super(title: 'Now Airing TV Shows');

  @override
  Widget buildBody() {
    return BlocBuilder<NowAiringTvShowsBloc, NowAiringTvShowsState>(
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
