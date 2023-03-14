import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/watchlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/get_tv_show_watchlist.dart';

part 'tv_show_watchlist_bloc.freezed.dart';
part 'tv_show_watchlist_event.dart';
part 'tv_show_watchlist_state.dart';

class TvShowWatchlistBloc
    extends Bloc<TvShowWatchlistEvent, TvShowWatchlistState> {
  TvShowWatchlistBloc(this._getTvShowWatchlist) : super(const _Initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetTvShowWatchlist _getTvShowWatchlist;

  void _fetchData(
      _FetchDataStarted event, Emitter<TvShowWatchlistState> emit) async {
    emit(_FetchDataInProgress(page: event.page));

    final result = await _getTvShowWatchlist();
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message, page: state.page)),
      (movies) => emit(_FetchDataSuccess(movies, page: state.page)),
    );
  }
}
