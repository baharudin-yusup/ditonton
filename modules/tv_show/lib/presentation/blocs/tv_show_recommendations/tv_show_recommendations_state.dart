part of 'tv_show_recommendations_bloc.dart';

@freezed
class TvShowRecommendationsState with _$TvShowRecommendationsState {
  const factory TvShowRecommendationsState.initial([@Default(1) int page]) =
      _Initial;

  const factory TvShowRecommendationsState.fetchDataInProgress(
      {@Default(1) int page}) = _FetchDataInProgress;

  const factory TvShowRecommendationsState.fetchDataSuccess(
      List<Watchlist> movies,
      {@Default(1) int page}) = _FetchDataSuccess;

  const factory TvShowRecommendationsState.fetchDataFailure(String message,
      {@Default(1) int page}) = _FetchDataFailure;
}
