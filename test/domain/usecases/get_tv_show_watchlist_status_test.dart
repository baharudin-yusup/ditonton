import 'package:ditonton/domain/usecases/get_tv_show_watchlist_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

typedef UsecaseType = GetTvShowWatchListStatus;

void main() {
  late UsecaseType usecase;
  late MockTvShowRepository repository;

  setUp(() {
    repository = MockTvShowRepository();
    usecase = UsecaseType(repository);
  });

  test('should get watchlist status from repository', () async {
    // arrange
    when(repository.isAddedToWatchlist(testTvShow.id))
        .thenAnswer((_) async => true);
    // act
    final result = await usecase(testTvShow.id);
    // assert
    expect(result, true);
  });
}
