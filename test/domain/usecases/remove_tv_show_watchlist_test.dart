import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/remove_tv_show_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

typedef UsecaseType = RemoveTvShowWatchlist;

void main() {
  late UsecaseType usecase;
  late MockTvShowRepository repository;

  setUp(() {
    repository = MockTvShowRepository();
    usecase = UsecaseType(repository);
  });

  test('should remove watchlist tv show from repository', () async {
    // arrange
    when(repository.removeWatchlist(testTvShowDetail))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = await usecase(testTvShowDetail);
    // assert
    verify(repository.removeWatchlist(testTvShowDetail));
    expect(result, Right('Removed from watchlist'));
  });
}
