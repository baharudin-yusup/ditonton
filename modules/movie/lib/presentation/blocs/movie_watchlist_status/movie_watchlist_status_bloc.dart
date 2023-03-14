import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/movie_detail.dart';
import '../../../movie.dart';

part 'movie_watchlist_status_bloc.freezed.dart';
part 'movie_watchlist_status_event.dart';
part 'movie_watchlist_status_state.dart';

class MovieWatchlistStatusBloc
    extends Bloc<MovieWatchlistStatusEvent, MovieWatchlistStatusState> {
  MovieWatchlistStatusBloc(
      this._getMovieWatchlistStatus,
      this._saveMovieWatchlist,
      this._removeMovieWatchlist,
      this._movieWatchlistBloc)
      : super(const _Initial()) {
    on<_FetchDataStarted>(_fetchData);
    on<_ToggleWatchlistStarted>(_toggleWatchlist);
  }

  final MovieWatchlistBloc _movieWatchlistBloc;
  final GetMovieWatchListStatus _getMovieWatchlistStatus;
  final SaveMovieWatchlist _saveMovieWatchlist;
  final RemoveMovieWatchlist _removeMovieWatchlist;

  void _fetchData(
      _FetchDataStarted event, Emitter<MovieWatchlistStatusState> emit) async {
    emit(const _FetchDataInProgress());

    final isAddedToWatchlist = await _getMovieWatchlistStatus(event.movieId);
    emit(_FetchDataSuccess(isAddedToWatchlist));
  }

  void _toggleWatchlist(_ToggleWatchlistStarted event,
      Emitter<MovieWatchlistStatusState> emit) async {
    emit(const _FetchDataInProgress());

    final isAddedToWatchlist = await _getMovieWatchlistStatus(event.movie.id);

    if (isAddedToWatchlist) {
      final result = await _removeMovieWatchlist(event.movie);
      result.fold(
        (failure) => _FetchDataFailure(failure.message),
        (message) {
          emit(_FetchDataSuccess(false, message: message));
          _movieWatchlistBloc.add(const MovieWatchlistEvent.fetchDataStarted());
        },
      );
    } else {
      final result = await _saveMovieWatchlist(event.movie);
      result.fold(
        (failure) => _FetchDataFailure(failure.message),
        (message) {
          emit(_FetchDataSuccess(true, message: message));
          _movieWatchlistBloc.add(const MovieWatchlistEvent.fetchDataStarted());
        },
      );
    }
  }
}
