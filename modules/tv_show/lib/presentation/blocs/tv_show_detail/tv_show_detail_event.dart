part of 'tv_show_detail_bloc.dart';

@freezed
class TvShowDetailEvent with _$TvShowDetailEvent {
  const factory TvShowDetailEvent.fetchDataStarted(int id) = _FetchDataStarted;
}
