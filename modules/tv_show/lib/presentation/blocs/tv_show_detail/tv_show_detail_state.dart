part of 'tv_show_detail_bloc.dart';

@freezed
class TvShowDetailState with _$TvShowDetailState {
  const factory TvShowDetailState.initial() = _Initial;

  const factory TvShowDetailState.fetchDataInProgress() = _FetchDataInProgress;

  const factory TvShowDetailState.fetchDataSuccess(
    TvShowDetail tvShowDetail,
  ) = _FetchDataSuccess;

  const factory TvShowDetailState.fetchDataFailure(
    String message,
  ) = _FetchDataFailure;
}
