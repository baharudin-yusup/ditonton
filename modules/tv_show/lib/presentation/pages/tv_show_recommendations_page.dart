import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tv_show_recommendations/tv_show_recommendations_bloc.dart';
import 'tv_show_detail_page.dart';

class TvShowRecommendationsPage extends EntertainmentListPage {
  static const routeName = '/tv-show-recommendations';
  final int movieId;

  const TvShowRecommendationsPage(this.movieId, {super.key})
      : super(title: 'TV Show Recommendations');

  @override
  Widget buildBody() {
    return BlocBuilder<TvShowRecommendationsBloc, TvShowRecommendationsState>(
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
