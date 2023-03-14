part of 'top_rated_movies_bloc.dart';

@freezed
class TopRatedMoviesState with _$TopRatedMoviesState {
  const factory TopRatedMoviesState.initial([@Default(1) int page]) = _Initial;

  const factory TopRatedMoviesState.fetchDataInProgress(
      {@Default(1) int page}) = _FetchDataInProgress;

  const factory TopRatedMoviesState.fetchDataSuccess(List<Watchlist> movies,
      {@Default(1) int page}) = _FetchDataSuccess;

  const factory TopRatedMoviesState.fetchDataFailure(String message,
      {@Default(1) int page}) = _FetchDataFailure;
}
