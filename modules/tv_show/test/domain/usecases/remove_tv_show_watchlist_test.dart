import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_show/domain/usecases/usecases.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveTvShowWatchlist usecase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = RemoveTvShowWatchlist(mockTvShowRepository);
  });

  test('should remove watchlist movie from repository', () async {
    // arrange
    when(mockTvShowRepository.removeWatchlist(testTvShowDetail))
        .thenAnswer((_) async => const Right('Removed from watchlist'));
    // act
    final result = await usecase(testTvShowDetail);
    // assert
    verify(mockTvShowRepository.removeWatchlist(testTvShowDetail));
    expect(result, const Right('Removed from watchlist'));
  });
}
