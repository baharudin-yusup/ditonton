part of 'tv_show_watchlist_bloc.dart';

@freezed
class TvShowWatchlistState with _$TvShowWatchlistState {
  const factory TvShowWatchlistState.initial([@Default(1) int page]) = _Initial;

  const factory TvShowWatchlistState.fetchDataInProgress(
      {@Default(1) int page}) = _FetchDataInProgress;

  const factory TvShowWatchlistState.fetchDataSuccess(List<Watchlist> movies,
      {@Default(1) int page}) = _FetchDataSuccess;

  const factory TvShowWatchlistState.fetchDataFailure(String message,
      {@Default(1) int page}) = _FetchDataFailure;
}
