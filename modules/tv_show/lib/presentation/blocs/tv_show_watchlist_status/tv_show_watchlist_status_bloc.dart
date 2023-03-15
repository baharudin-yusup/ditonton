import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/get_tv_show_watchlist_status.dart';
import '../../../domain/usecases/remove_tv_show_watchlist.dart';
import '../../../domain/usecases/save_tv_show_watchlist.dart';
import '../tv_show_watchlist/tv_show_watchlist_bloc.dart';

part 'tv_show_watchlist_status_bloc.freezed.dart';
part 'tv_show_watchlist_status_event.dart';
part 'tv_show_watchlist_status_state.dart';

class TvShowWatchlistStatusBloc
    extends Bloc<TvShowWatchlistStatusEvent, TvShowWatchlistStatusState> {
  TvShowWatchlistStatusBloc(
    this._tvShowWatchlistBloc,
    this._getTvShowWatchlistStatus,
    this._saveTvShowWatchlist,
    this._removeTvShowWatchlist,
  ) : super(const _Initial()) {
    on<_FetchDataStarted>(_fetchData);
    on<_ToggleWatchlistStarted>(_toggleWatchlist);
  }

  final TvShowWatchlistBloc _tvShowWatchlistBloc;
  final GetTvShowWatchlistStatus _getTvShowWatchlistStatus;
  final SaveTvShowWatchlist _saveTvShowWatchlist;
  final RemoveTvShowWatchlist _removeTvShowWatchlist;

  void _fetchData(
      _FetchDataStarted event, Emitter<TvShowWatchlistStatusState> emit) async {
    emit(const _FetchDataInProgress());

    final isAddedToWatchlist = await _getTvShowWatchlistStatus(event.id);
    emit(_FetchDataSuccess(isAddedToWatchlist));
  }

  void _toggleWatchlist(_ToggleWatchlistStarted event,
      Emitter<TvShowWatchlistStatusState> emit) async {
    emit(const _FetchDataInProgress());

    final isAddedToWatchlist = await _getTvShowWatchlistStatus(event.tvShow.id);

    if (isAddedToWatchlist) {
      final result = await _removeTvShowWatchlist(event.tvShow);
      result.fold(
        (failure) => emit(_FetchDataFailure(failure.message)),
        (message) {
          emit(_FetchDataSuccess(false, message: message));
          _tvShowWatchlistBloc
              .add(const TvShowWatchlistEvent.fetchDataStarted());
        },
      );
    } else {
      final result = await _saveTvShowWatchlist(event.tvShow);
      result.fold(
        (failure) => emit(_FetchDataFailure(failure.message)),
        (message) {
          emit(_FetchDataSuccess(true, message: message));
          _tvShowWatchlistBloc
              .add(const TvShowWatchlistEvent.fetchDataStarted());
        },
      );
    }
  }
}
