import 'package:core/domain/entities/watchlist.dart';
import 'package:core/presentation/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/search_tv_shows/search_tv_shows_bloc.dart';
import 'tv_show_detail_page.dart';

class SearchTvShowsPage extends SearchPage {
  static const routeName = '/search-tv-shows';

  SearchTvShowsPage({Key? key}) : super(key: key);

  @override
  Widget buildBody() {
    return BlocBuilder<SearchTvShowsBloc, SearchTvShowsState>(
      builder: (context, state) {
        return state.when(
          initial: (_) => showInitialState(),
          searchDataInProgress: (_) => showLoading(),
          searchDataSuccess: (movies, _) =>
              movies.isNotEmpty ? showContents(movies) : showEmptyContent(),
          searchDataFailure: (message, _) => showFailure(message),
        );
      },
    );
  }

  @override
  void onSubmitted(BuildContext context, String query) {
    context
        .read<SearchTvShowsBloc>()
        .add(SearchTvShowsEvent.searchDataStarted(query: query));
  }

  @override
  void onCardTapped(BuildContext context, Watchlist data) {
    Navigator.pushNamed(context, TvShowDetailPage.routeName,
        arguments: data.id);
  }
}
