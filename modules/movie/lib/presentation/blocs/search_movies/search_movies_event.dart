part of 'search_movies_bloc.dart';

@freezed
class SearchMoviesEvent with _$SearchMoviesEvent {
  const factory SearchMoviesEvent.searchDataStarted(
      {required String query, @Default(1) int page}) = _SearchDataStarted;
}
