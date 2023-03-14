import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/watchlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/search_tv_shows.dart';

part 'search_tv_shows_bloc.freezed.dart';
part 'search_tv_shows_event.dart';
part 'search_tv_shows_state.dart';

class SearchTvShowsBloc extends Bloc<SearchTvShowsEvent, SearchTvShowsState> {
  SearchTvShowsBloc(this._searchTvShows) : super(const _Initial()) {
    on<_SearchDataStarted>(_searchData);
  }

  final SearchTvShows _searchTvShows;

  void _searchData(
      _SearchDataStarted event, Emitter<SearchTvShowsState> emit) async {
    emit(_SearchDataInProgress(page: event.page));

    final result = await _searchTvShows(event.query, event.page);
    result.fold(
      (failure) => emit(_SearchDataFailure(failure.message, page: state.page)),
      (movies) => emit(_SearchDataSuccess(movies, page: state.page)),
    );
  }
}
