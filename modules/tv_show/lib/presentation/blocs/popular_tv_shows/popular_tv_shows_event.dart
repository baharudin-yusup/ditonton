part of 'popular_tv_shows_bloc.dart';

@freezed
class PopularTvShowsEvent with _$PopularTvShowsEvent {
  const factory PopularTvShowsEvent.fetchDataStarted({@Default(1) int page}) =
      _FetchDataStarted;
}
