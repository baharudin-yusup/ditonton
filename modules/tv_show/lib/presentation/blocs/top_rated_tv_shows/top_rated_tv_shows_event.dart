part of 'top_rated_tv_shows_bloc.dart';

@freezed
class TopRatedTvShowsEvent with _$TopRatedTvShowsEvent {
  const factory TopRatedTvShowsEvent.fetchDataStarted({@Default(1) int page}) =
      _FetchDataStarted;
}
