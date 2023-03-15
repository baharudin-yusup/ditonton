import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_show/domain/usecases/usecases.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvShowDetail usecase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = GetTvShowDetail(mockTvShowRepository);
  });

  const tId = 1;

  test('should get movie detail from the repository', () async {
    // arrange
    when(mockTvShowRepository.getTvShowDetail(tId))
        .thenAnswer((_) async => Right(testTvShowDetail));
    // act
    final result = await usecase(tId);
    // assert
    expect(result, Right(testTvShowDetail));
  });
}
