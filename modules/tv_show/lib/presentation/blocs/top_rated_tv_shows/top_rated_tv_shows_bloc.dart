import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/watchlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/get_top_rated_tv_shows.dart';

part 'top_rated_tv_shows_bloc.freezed.dart';
part 'top_rated_tv_shows_event.dart';
part 'top_rated_tv_shows_state.dart';

class TopRatedTvShowsBloc
    extends Bloc<TopRatedTvShowsEvent, TopRatedTvShowsState> {
  TopRatedTvShowsBloc(this._getTopRatedTvShows) : super(const _Initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetTopRatedTvShows _getTopRatedTvShows;

  void _fetchData(
      _FetchDataStarted event, Emitter<TopRatedTvShowsState> emit) async {
    emit(_FetchDataInProgress(page: event.page));

    final result = await _getTopRatedTvShows(event.page);
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message, page: state.page)),
      (movies) => emit(_FetchDataSuccess(movies, page: state.page)),
    );
  }
}
