part of 'now_playing_movies_bloc.dart';

@freezed
class NowPlayingMoviesEvent with _$NowPlayingMoviesEvent {
  const factory NowPlayingMoviesEvent.fetchDataStarted({@Default(1) int page}) =
      _FetchDataStarted;
}
