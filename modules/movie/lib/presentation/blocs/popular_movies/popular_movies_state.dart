part of 'popular_movies_bloc.dart';

@freezed
class PopularMoviesState with _$PopularMoviesState {
  const factory PopularMoviesState.initial([@Default(1) int page]) = _Initial;

  const factory PopularMoviesState.fetchDataInProgress({@Default(1) int page}) =
      _FetchDataInProgress;

  const factory PopularMoviesState.fetchDataSuccess(List<Watchlist> movies,
      {@Default(1) int page}) = _FetchDataSuccess;

  const factory PopularMoviesState.fetchDataFailure(String message,
      {@Default(1) int page}) = _FetchDataFailure;
}
