part of 'movie_recommendations_bloc.dart';

@freezed
class MovieRecommendationsEvent with _$MovieRecommendationsEvent {
  const factory MovieRecommendationsEvent.fetchDataStarted(
      {required int movieId, @Default(1) int page}) = _FetchDataStarted;
}
