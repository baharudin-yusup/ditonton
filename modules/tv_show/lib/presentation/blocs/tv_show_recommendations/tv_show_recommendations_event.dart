part of 'tv_show_recommendations_bloc.dart';

@freezed
class TvShowRecommendationsEvent with _$TvShowRecommendationsEvent {
  const factory TvShowRecommendationsEvent.fetchDataStarted(int id,
      {@Default(1) int page}) = _FetchDataStarted;
}
