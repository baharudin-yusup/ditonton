part of 'search_tv_shows_bloc.dart';

@freezed
class SearchTvShowsState with _$SearchTvShowsState {
  const factory SearchTvShowsState.initial([@Default(1) int page]) = _Initial;

  const factory SearchTvShowsState.searchDataInProgress(
      {@Default(1) int page}) = _SearchDataInProgress;

  const factory SearchTvShowsState.searchDataSuccess(List<Watchlist> movies,
      {@Default(1) int page}) = _SearchDataSuccess;

  const factory SearchTvShowsState.searchDataFailure(String message,
      {@Default(1) int page}) = _SearchDataFailure;
}
