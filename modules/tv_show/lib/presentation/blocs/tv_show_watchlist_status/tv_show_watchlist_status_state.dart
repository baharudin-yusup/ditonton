part of 'tv_show_watchlist_status_bloc.dart';

@freezed
class TvShowWatchlistStatusState with _$TvShowWatchlistStatusState {
  const factory TvShowWatchlistStatusState.initial() = _Initial;

  const factory TvShowWatchlistStatusState.fetchDataInProgress() =
      _FetchDataInProgress;

  const factory TvShowWatchlistStatusState.fetchDataSuccess(
      bool isAddedToWatchlist,
      {String? message}) = _FetchDataSuccess;

  const factory TvShowWatchlistStatusState.fetchDataFailure(String message) =
      _FetchDataFailure;
}
