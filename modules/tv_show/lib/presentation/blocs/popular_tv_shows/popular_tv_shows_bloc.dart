import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/watchlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/get_popular_tv_shows.dart';

part 'popular_tv_shows_bloc.freezed.dart';
part 'popular_tv_shows_event.dart';
part 'popular_tv_shows_state.dart';

class PopularTvShowsBloc
    extends Bloc<PopularTvShowsEvent, PopularTvShowsState> {
  PopularTvShowsBloc(this._getPopularTvShows) : super(const _Initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetPopularTvShows _getPopularTvShows;

  void _fetchData(
      _FetchDataStarted event, Emitter<PopularTvShowsState> emit) async {
    emit(_FetchDataInProgress(page: event.page));

    final result = await _getPopularTvShows(event.page);
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message, page: state.page)),
      (movies) => emit(_FetchDataSuccess(movies, page: state.page)),
    );
  }
}
