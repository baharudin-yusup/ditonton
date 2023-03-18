import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/watchlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/get_now_airing_tv_shows.dart';

part 'now_airing_tv_shows_bloc.freezed.dart';
part 'now_airing_tv_shows_event.dart';
part 'now_airing_tv_shows_state.dart';

class NowAiringTvShowsBloc
    extends Bloc<NowAiringTvShowsEvent, NowAiringTvShowsState> {
  NowAiringTvShowsBloc(this._getNowAiringTvShows) : super(const _Initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetNowAiringTvShows _getNowAiringTvShows;

  void _fetchData(
      _FetchDataStarted event, Emitter<NowAiringTvShowsState> emit) async {
    emit(_FetchDataInProgress(page: event.page));

    final result = await _getNowAiringTvShows(event.page);
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message, page: state.page)),
      (movies) => emit(_FetchDataSuccess(movies, page: state.page)),
    );
  }
}
