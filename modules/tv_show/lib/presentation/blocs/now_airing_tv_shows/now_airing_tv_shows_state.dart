part of 'now_airing_tv_shows_bloc.dart';

@freezed
class NowAiringTvShowsState with _$NowAiringTvShowsState {
  const factory NowAiringTvShowsState.initial([@Default(1) int page]) =
      _Initial;

  const factory NowAiringTvShowsState.fetchDataInProgress(
      {@Default(1) int page}) = _FetchDataInProgress;

  const factory NowAiringTvShowsState.fetchDataSuccess(List<Watchlist> movies,
      {@Default(1) int page}) = _FetchDataSuccess;

  const factory NowAiringTvShowsState.fetchDataFailure(String message,
      {@Default(1) int page}) = _FetchDataFailure;
}
