part of 'movie_detail_bloc.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState.initial() = _Initial;

  const factory MovieDetailState.fetchDataInProgress() = _FetchDataInProgress;

  const factory MovieDetailState.fetchDataSuccess(
    MovieDetail movieDetail,
  ) = _FetchDataSuccess;

  const factory MovieDetailState.fetchDataFailure(
    String message,
  ) = _FetchDataFailure;
}
