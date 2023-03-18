import 'package:bloc_test/bloc_test.dart';
import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/core_init_helper.dart';
import '../../helpers/core_init_helper.mocks.dart';
import 'movie_detail_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetMovieDetail>()])
void main() {
  mockInitLocator();
  late MockGetMovieDetail mockGetMovieDetail;
  late MockLogSelectedContent mockLogSelectedContent;
  late MovieDetailBloc bloc;
  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockLogSelectedContent = MockLogSelectedContent();
    bloc = MovieDetailBloc(mockGetMovieDetail, mockLogSelectedContent);
  });

  const tId = 1;

  blocTest<MovieDetailBloc, MovieDetailState>(
    'should emits [] '
    'when nothing is added',
    build: () => bloc,
    expect: () => [],
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
      'should emits [_FetchDataInProgress, _FetchDataSuccess] '
      'when _FetchDataStarted is added and usecase return is failure',
      build: () {
        when(mockGetMovieDetail(tId))
            .thenAnswer((_) async => const Right(testMovieDetail));
        when(mockLogSelectedContent(
                contentType: 'movie', contentId: testMovieDetail.id.toString()))
            .thenAnswer((_) async => const Right(unit));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const MovieDetailEvent.fetchDataStarted(movieId: tId));
      },
      expect: () => const <MovieDetailState>[
            MovieDetailState.fetchDataInProgress(),
            MovieDetailState.fetchDataSuccess(testMovieDetail)
          ],
      verify: (_) {
        verify(mockGetMovieDetail(tId)).called(1);
      });

  blocTest<MovieDetailBloc, MovieDetailState>(
      'should emits [_FetchDataInProgress, _FetchDataFailure] '
      'when _FetchDataStarted is added and usecase return is failure',
      build: () {
        when(mockGetMovieDetail(tId))
            .thenAnswer((_) async => const Left(ServerFailure('')));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const MovieDetailEvent.fetchDataStarted(movieId: tId));
      },
      expect: () => const <MovieDetailState>[
            MovieDetailState.fetchDataInProgress(),
            MovieDetailState.fetchDataFailure('')
          ],
      verify: (_) {
        verify(mockGetMovieDetail(tId)).called(1);
      });
}
