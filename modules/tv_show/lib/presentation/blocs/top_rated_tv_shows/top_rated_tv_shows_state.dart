part of 'top_rated_tv_shows_bloc.dart';

@freezed
class TopRatedTvShowsState with _$TopRatedTvShowsState {
  const factory TopRatedTvShowsState.initial([@Default(1) int page]) = _Initial;

  const factory TopRatedTvShowsState.fetchDataInProgress(
      {@Default(1) int page}) = _FetchDataInProgress;

  const factory TopRatedTvShowsState.fetchDataSuccess(List<Watchlist> movies,
      {@Default(1) int page}) = _FetchDataSuccess;

  const factory TopRatedTvShowsState.fetchDataFailure(String message,
      {@Default(1) int page}) = _FetchDataFailure;
}
