import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/watchlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/get_popular_movies.dart';

part 'popular_movies_bloc.freezed.dart';
part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc(this._getPopularMovies)
      : super(const PopularMoviesState.initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetPopularMovies _getPopularMovies;

  void _fetchData(
      _FetchDataStarted event, Emitter<PopularMoviesState> emit) async {
    emit(_FetchDataInProgress(page: event.page));

    final result = await _getPopularMovies(event.page);
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message, page: state.page)),
      (movies) => emit(_FetchDataSuccess(movies, page: state.page)),
    );
  }
}
