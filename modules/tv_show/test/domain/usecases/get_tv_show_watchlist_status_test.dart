import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_show/domain/usecases/get_tv_show_watchlist_status.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvShowWatchlistStatus usecase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = GetTvShowWatchlistStatus(mockTvShowRepository);
  });

  test('should get watchlist status from repository', () async {
    // arrange
    when(mockTvShowRepository.isAddedToWatchlist(1))
        .thenAnswer((_) async => true);
    // act
    final result = await usecase(1);
    // assert
    expect(result, true);
  });
}
