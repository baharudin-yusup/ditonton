import 'package:flutter_test/flutter_test.dart';
import 'package:movie/data/models/models.dart';
import 'package:movie/domain/entities/entities.dart';

void main() {
  const tMovieModel = MovieModel(
    false,
    'backdropPath',
    [1, 2, 3],
    1,
    'originalTitle',
    'overview',
    1,
    'posterPath',
    'releaseDate',
    'title',
    false,
    1,
    1,
  );

  const tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    name: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  test('should be a subclass of Movie entity', () async {
    final result = tMovieModel.toEntity();
    expect(result, tMovie);
  });
}
