import 'package:core/domain/entities/watchlist.dart';
import 'package:core/presentation/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../movie.dart';
import '../blocs/search_movies/search_movies_bloc.dart';

class SearchMoviesPage extends SearchPage {
  static const routeName = '/search-movies';

  SearchMoviesPage({Key? key}) : super(key: key);

  @override
  Widget buildBody() {
    return BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
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
        .read<SearchMoviesBloc>()
        .add(SearchMoviesEvent.searchDataStarted(query: query));
  }

  @override
  void onCardTapped(BuildContext context, Watchlist data) {
    Navigator.pushNamed(context, MovieDetailPage.routeName, arguments: data.id);
  }
}
