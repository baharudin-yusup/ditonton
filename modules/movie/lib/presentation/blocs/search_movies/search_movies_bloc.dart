import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/watchlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/search_movies.dart';

part 'search_movies_bloc.freezed.dart';
part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  SearchMoviesBloc(this._searchMovies) : super(const _Initial()) {
    on<_SearchDataStarted>(_searchData);
  }

  final SearchMovies _searchMovies;

  void _searchData(
      _SearchDataStarted event, Emitter<SearchMoviesState> emit) async {
    emit(_SearchDataInProgress(page: event.page));

    final result = await _searchMovies(event.query, event.page);
    result.fold(
      (failure) => emit(_SearchDataFailure(failure.message, page: state.page)),
      (movies) => emit(_SearchDataSuccess(movies, page: state.page)),
    );
  }
}
