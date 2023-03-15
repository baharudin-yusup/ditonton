import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_show/domain/entities/tv_show.dart';
import 'package:tv_show/domain/usecases/usecases.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTvShows usecase;
  late MockTvShowRepository mockRepository;

  setUp(() {
    mockRepository = MockTvShowRepository();
    usecase = GetPopularTvShows(mockRepository);
  });

  final tTvShows = <TvShow>[];

  group('GetPopularTvShows Tests', () {
    group('execute', () {
      test(
          'should get list of movies from the repository when execute function is called',
          () async {
        // arrange
        when(mockRepository.getPopularTvShows())
            .thenAnswer((_) async => Right(tTvShows));
        // act
        final result = await usecase();
        // assert
        expect(result, Right(tTvShows));
      });
    });
  });
}
