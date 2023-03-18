part of 'popular_tv_shows_bloc.dart';

@freezed
class PopularTvShowsState with _$PopularTvShowsState {
  const factory PopularTvShowsState.initial([@Default(1) int page]) = _Initial;

  const factory PopularTvShowsState.fetchDataInProgress(
      {@Default(1) int page}) = _FetchDataInProgress;

  const factory PopularTvShowsState.fetchDataSuccess(List<Watchlist> movies,
      {@Default(1) int page}) = _FetchDataSuccess;

  const factory PopularTvShowsState.fetchDataFailure(String message,
      {@Default(1) int page}) = _FetchDataFailure;
}
