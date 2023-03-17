part of 'tv_show_watchlist_bloc.dart';

@freezed
class TvShowWatchlistEvent with _$TvShowWatchlistEvent {
  const factory TvShowWatchlistEvent.fetchDataStarted({@Default(1) int page}) =
      _FetchDataStarted;
}
