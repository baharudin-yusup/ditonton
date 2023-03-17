part of 'movie_detail_bloc.dart';

@freezed
class MovieDetailEvent with _$MovieDetailEvent {
  const factory MovieDetailEvent.fetchDataStarted({required int movieId}) =
      _FetchDataStarted;
}
