import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_show/domain/entities/tv_show.dart';
import 'package:tv_show/domain/usecases/get_now_airing_tv_shows.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetNowAiringTvShows usecase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = GetNowAiringTvShows(mockTvShowRepository);
  });

  final tTvShows = <TvShow>[];

  test('should get list of movies from the repository', () async {
    // arrange
    when(mockTvShowRepository.getNowAiringTvShows())
        .thenAnswer((_) async => Right(tTvShows));
    // act
    final result = await usecase();
    // assert
    expect(result, Right(tTvShows));
  });
}
