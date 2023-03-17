import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/movie_detail.dart';
import '../../../domain/usecases/get_movie_detail.dart';

part 'movie_detail_bloc.freezed.dart';
part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(this._getMovieDetail)
      : super(const MovieDetailState.initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetMovieDetail _getMovieDetail;

  void _fetchData(
      _FetchDataStarted event, Emitter<MovieDetailState> emit) async {
    emit(const _FetchDataInProgress());

    final result = await _getMovieDetail(event.movieId);
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message)),
      (movieDetail) => emit(_FetchDataSuccess(movieDetail)),
    );
  }
}
