part of 'search_movies_bloc.dart';

@freezed
class SearchMoviesState with _$SearchMoviesState {
  const factory SearchMoviesState.initial([@Default(1) int page]) = _Initial;

  const factory SearchMoviesState.searchDataInProgress({@Default(1) int page}) =
      _SearchDataInProgress;

  const factory SearchMoviesState.searchDataSuccess(List<Watchlist> movies,
      {@Default(1) int page}) = _SearchDataSuccess;

  const factory SearchMoviesState.searchDataFailure(String message,
      {@Default(1) int page}) = _SearchDataFailure;
}
