part of 'movie_watchlist_bloc.dart';

@freezed
class MovieWatchlistEvent with _$MovieWatchlistEvent {
  const factory MovieWatchlistEvent.fetchDataStarted() = _FetchDataStarted;
}
