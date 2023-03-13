import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_show_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

typedef UsecaseType = GetTvShowDetail;

void main() {
  late UsecaseType usecase;
  late MockTvShowRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockTvShowRepository();
    usecase = UsecaseType(mockMovieRepository);
  });

  test('should get $TvShowDetail from the repository', () async {
    // arrange
    when(mockMovieRepository.getTvShowDetail(testTvShowDetail.id))
        .thenAnswer((_) async => Right(testTvShowDetail));
    // act
    final result = await usecase(testTvShowDetail.id);
    // assert
    expect(result, Right(testTvShowDetail));
  });
}
