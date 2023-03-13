import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

typedef UsecaseType = GetTopRatedTvShows;

void main() {
  late UsecaseType usecase;
  late MockTvShowRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockTvShowRepository();
    usecase = UsecaseType(mockMovieRepository);
  });

  final tEntityList = [testTvShow];

  test('should get list of $TvShow from the repository', () async {
    // arrange
    when(mockMovieRepository.getTopRatedTvShows())
        .thenAnswer((_) async => Right(tEntityList));
    // act
    final result = await usecase();
    // assert
    expect(result, Right(tEntityList));
  });
}
