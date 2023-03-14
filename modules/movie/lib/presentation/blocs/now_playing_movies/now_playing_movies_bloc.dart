import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/watchlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/get_now_playing_movies.dart';

part 'now_playing_movies_bloc.freezed.dart';
part 'now_playing_movies_event.dart';
part 'now_playing_movies_state.dart';

class NowPlayingMoviesBloc
    extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  NowPlayingMoviesBloc(this._getNowPlayingMovies) : super(const _Initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetNowPlayingMovies _getNowPlayingMovies;

  void _fetchData(
      _FetchDataStarted event, Emitter<NowPlayingMoviesState> emit) async {
    emit(_FetchDataInProgress(page: event.page));

    final result = await _getNowPlayingMovies(event.page);
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message, page: state.page)),
      (movies) => emit(_FetchDataSuccess(movies, page: state.page)),
    );
  }
}
