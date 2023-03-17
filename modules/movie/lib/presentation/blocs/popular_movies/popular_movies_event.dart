part of 'popular_movies_bloc.dart';

@freezed
class PopularMoviesEvent with _$PopularMoviesEvent {
  const factory PopularMoviesEvent.fetchDataStarted({@Default(1) int page}) =
      _FetchDataStarted;
}
