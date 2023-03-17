part of 'search_tv_shows_bloc.dart';

@freezed
class SearchTvShowsEvent with _$SearchTvShowsEvent {
  const factory SearchTvShowsEvent.searchDataStarted(
      {required String query, @Default(1) int page}) = _SearchDataStarted;
}
