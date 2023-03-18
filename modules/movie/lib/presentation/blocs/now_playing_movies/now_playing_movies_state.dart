part of 'now_playing_movies_bloc.dart';

@freezed
class NowPlayingMoviesState with _$NowPlayingMoviesState {
  const factory NowPlayingMoviesState.initial([@Default(1) int page]) =
      _Initial;

  const factory NowPlayingMoviesState.fetchDataInProgress(
      {@Default(1) int page}) = _FetchDataInProgress;

  const factory NowPlayingMoviesState.fetchDataSuccess(List<Watchlist> movies,
      {@Default(1) int page}) = _FetchDataSuccess;

  const factory NowPlayingMoviesState.fetchDataFailure(String message,
      {@Default(1) int page}) = _FetchDataFailure;
}
