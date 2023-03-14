part of 'tv_show_watchlist_status_bloc.dart';

@freezed
class TvShowWatchlistStatusEvent with _$TvShowWatchlistStatusEvent {
  const factory TvShowWatchlistStatusEvent.fetchDataStarted(int id) =
      _FetchDataStarted;

  const factory TvShowWatchlistStatusEvent.toggleWatchlistStarted(
      TvShowDetail tvShow) = _ToggleWatchlistStarted;
}
