import 'package:core/core.dart';
import 'package:core/presentation/pages/raw_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tv_show_watchlist/tv_show_watchlist_bloc.dart';
import 'tv_show_detail_page.dart';

class TvShowWatchlistPage extends RawListPage {
  const TvShowWatchlistPage({super.key});

  @override
  Widget buildBody() {
    return BlocBuilder<TvShowWatchlistBloc, TvShowWatchlistState>(
      builder: (context, state) {
        return state.when(
          initial: (_) => showInitialState(),
          fetchDataInProgress: (_) => showLoading(),
          fetchDataSuccess: (data, _) =>
              data.isNotEmpty ? showContents(data) : showEmptyContent(),
          fetchDataFailure: (message, _) => showErrorMessage(message),
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
