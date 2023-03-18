import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/get_movie_recommendations.dart';

part 'movie_recommendations_bloc.freezed.dart';
part 'movie_recommendations_event.dart';
part 'movie_recommendations_state.dart';

class MovieRecommendationsBloc
    extends Bloc<MovieRecommendationsEvent, MovieRecommendationsState> {
  MovieRecommendationsBloc(this._getMovieRecommendations)
      : super(const _Initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetMovieRecommendations _getMovieRecommendations;

  void _fetchData(
      _FetchDataStarted event, Emitter<MovieRecommendationsState> emit) async {
    emit(_FetchDataInProgress(page: event.page));

    final result = await _getMovieRecommendations(event.movieId, event.page);
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message, page: state.page)),
      (movies) => emit(_FetchDataSuccess(movies, page: state.page)),
    );
  }
}
