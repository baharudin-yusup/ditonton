part of 'movie_watchlist_status_bloc.dart';

@freezed
class MovieWatchlistStatusEvent with _$MovieWatchlistStatusEvent {
  const factory MovieWatchlistStatusEvent.fetchDataStarted(int movieId) =
      _FetchDataStarted;

  const factory MovieWatchlistStatusEvent.toggleWatchlistStarted(
      MovieDetail movie) = _ToggleWatchlistStarted;
}
