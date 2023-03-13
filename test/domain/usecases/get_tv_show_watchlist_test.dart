import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/get_tv_show_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

typedef UsecaseType = GetTvShowWatchlist;

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
    when(mockMovieRepository.getWatchlistTvShows())
        .thenAnswer((_) async => Right(tEntityList));
    // act
    final result = await usecase();
    // assert
    expect(result, Right(tEntityList));
  });
}
