import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/search_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

typedef UsecaseType = SearchTvShows;

void main() {
  late UsecaseType usecase;
  late MockTvShowRepository mockRepository;

  setUp(() {
    mockRepository = MockTvShowRepository();
    usecase = UsecaseType(mockRepository);
  });

  final tEntityList = [testTvShow];

  test('should get list of $TvShow from the repository', () async {
    // arrange
    when(mockRepository.searchTvShows('Spider'))
        .thenAnswer((_) async => Right(tEntityList));
    // act
    final result = await usecase('Spider');
    // assert
    expect(result, Right(tEntityList));
  });
}
