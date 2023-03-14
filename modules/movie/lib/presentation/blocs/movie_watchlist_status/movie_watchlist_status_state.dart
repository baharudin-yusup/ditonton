part of 'movie_watchlist_status_bloc.dart';

@freezed
class MovieWatchlistStatusState with _$MovieWatchlistStatusState {
  const factory MovieWatchlistStatusState.initial() = _Initial;

  const factory MovieWatchlistStatusState.fetchDataInProgress() =
      _FetchDataInProgress;

  const factory MovieWatchlistStatusState.fetchDataSuccess(
      bool isAddedToWatchlist,
      {String? message}) = _FetchDataSuccess;

  const factory MovieWatchlistStatusState.fetchDataFailure(String message) =
      _FetchDataFailure;
}
