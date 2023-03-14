part of 'now_plating_movies_bloc.dart';

@freezed
class NowPlatingMoviesState with _$NowPlatingMoviesState {
  const factory NowPlatingMoviesState.initial([@Default(1) int page]) =
      _Initial;

  const factory NowPlatingMoviesState.fetchDataInProgress(
      {@Default(1) int page}) = _FetchDataInProgress;

  const factory NowPlatingMoviesState.fetchDataSuccess(List<Watchlist> movies,
      {@Default(1) int page}) = _FetchDataSuccess;

  const factory NowPlatingMoviesState.fetchDataFailure(String message,
      {@Default(1) int page}) = _FetchDataFailure;
}
