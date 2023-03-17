part of 'now_airing_tv_shows_bloc.dart';

@freezed
class NowAiringTvShowsEvent with _$NowAiringTvShowsEvent {
  const factory NowAiringTvShowsEvent.fetchDataStarted({@Default(1) int page}) =
      _FetchDataStarted;
}
