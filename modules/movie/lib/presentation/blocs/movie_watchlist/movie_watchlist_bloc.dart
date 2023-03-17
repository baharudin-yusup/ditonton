import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/get_movie_watchlist.dart';

part 'movie_watchlist_bloc.freezed.dart';
part 'movie_watchlist_event.dart';
part 'movie_watchlist_state.dart';

class MovieWatchlistBloc
    extends Bloc<MovieWatchlistEvent, MovieWatchlistState> {
  MovieWatchlistBloc(this._getMovieWatchlist)
      : super(const MovieWatchlistState.initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetMovieWatchlist _getMovieWatchlist;

  void _fetchData(
      _FetchDataStarted event, Emitter<MovieWatchlistState> emit) async {
    emit(const _FetchDataInProgress());

    final result = await _getMovieWatchlist();
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message)),
      (movies) => emit(_FetchDataSuccess(movies)),
    );
  }
}
