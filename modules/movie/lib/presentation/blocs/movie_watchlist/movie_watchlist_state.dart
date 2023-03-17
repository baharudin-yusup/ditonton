part of 'movie_watchlist_bloc.dart';

@freezed
class MovieWatchlistState with _$MovieWatchlistState {
  const factory MovieWatchlistState.initial() = _Initial;

  const factory MovieWatchlistState.fetchDataInProgress() =
      _FetchDataInProgress;

  const factory MovieWatchlistState.fetchDataSuccess(
    List<Watchlist> movies,
  ) = _FetchDataSuccess;

  const factory MovieWatchlistState.fetchDataFailure(
    String message,
  ) = _FetchDataFailure;
}
