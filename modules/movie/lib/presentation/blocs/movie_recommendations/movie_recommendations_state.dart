part of 'movie_recommendations_bloc.dart';

@freezed
class MovieRecommendationsState with _$MovieRecommendationsState {
  const factory MovieRecommendationsState.initial([@Default(1) int page]) =
      _Initial;

  const factory MovieRecommendationsState.fetchDataInProgress(
      {@Default(1) int page}) = _FetchDataInProgress;

  const factory MovieRecommendationsState.fetchDataSuccess(
      List<Watchlist> movies,
      {@Default(1) int page}) = _FetchDataSuccess;

  const factory MovieRecommendationsState.fetchDataFailure(String message,
      {@Default(1) int page}) = _FetchDataFailure;
}
