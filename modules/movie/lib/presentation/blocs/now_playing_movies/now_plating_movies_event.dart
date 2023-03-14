part of 'now_plating_movies_bloc.dart';

@freezed
class NowPlatingMoviesEvent with _$NowPlatingMoviesEvent {
  const factory NowPlatingMoviesEvent.fetchDataStarted({@Default(1) int page}) =
      _FetchDataStarted;
}
