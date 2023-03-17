import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/watchlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/get_top_rated_movies.dart';

part 'top_rated_movies_bloc.freezed.dart';
part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  TopRatedMoviesBloc(this._getTopRatedMovies)
      : super(const TopRatedMoviesState.initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetTopRatedMovies _getTopRatedMovies;

  void _fetchData(
      _FetchDataStarted event, Emitter<TopRatedMoviesState> emit) async {
    emit(_FetchDataInProgress(page: event.page));

    final result = await _getTopRatedMovies(event.page);
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message, page: state.page)),
      (movies) => emit(_FetchDataSuccess(movies, page: state.page)),
    );
  }
}
