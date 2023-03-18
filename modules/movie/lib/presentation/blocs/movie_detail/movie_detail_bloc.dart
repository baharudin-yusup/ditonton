import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/movie_detail.dart';
import '../../../domain/usecases/get_movie_detail.dart';

part 'movie_detail_bloc.freezed.dart';
part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(this._getMovieDetail, this._logSelectedContent)
      : super(const MovieDetailState.initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetMovieDetail _getMovieDetail;
  final LogSelectedContent _logSelectedContent;

  void _fetchData(
      _FetchDataStarted event, Emitter<MovieDetailState> emit) async {
    emit(const _FetchDataInProgress());

    final result = await _getMovieDetail(event.movieId);
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message)),
      (movieDetail) => emit(_FetchDataSuccess(movieDetail)),
    );

    if (result.isLeft()) {
      return;
    }

    final logSelectedContent = await _logSelectedContent(
      contentType: 'movie',
      contentId: event.movieId.toString(),
    );

    logSelectedContent.fold((failure) {
      Logger.error(failure, event: 'calling $LogSelectedContent usecase');
    }, (_) {
      Logger.print('Adding firebase analytics logSelectedContent success!');
    });
  }
}
