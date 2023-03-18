import 'package:bloc_test/bloc_test.dart';
import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_recommendations_bloc_test.mocks.dart';

typedef BlocType = MovieRecommendationsBloc;
typedef StateType = MovieRecommendationsState;
typedef EventType = MovieRecommendationsEvent;

@GenerateNiceMocks([MockSpec<GetMovieRecommendations>()])
void main() {
  late MockGetMovieRecommendations mockUsecase;
  late MovieRecommendationsBloc bloc;
  setUp(() {
    mockUsecase = MockGetMovieRecommendations();
    bloc = MovieRecommendationsBloc(mockUsecase);
  });

  const tId = 1;
  final successData = testMovieList;
  const failureMessage = '';

  blocTest<BlocType, StateType>(
    'should emits [] '
    'when nothing is added',
    build: () => bloc,
    expect: () => [],
  );

  blocTest<BlocType, StateType>(
      'should emits [_FetchDataInProgress, _FetchDataSuccess] '
      'when _FetchDataStarted is added and usecase return is failure',
      build: () {
        when(mockUsecase(tId)).thenAnswer((_) async => Right(successData));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const EventType.fetchDataStarted(movieId: tId));
      },
      expect: () => <StateType>[
            const StateType.fetchDataInProgress(),
            StateType.fetchDataSuccess(successData)
          ],
      verify: (_) {
        verify(mockUsecase(tId)).called(1);
      });

  blocTest<BlocType, StateType>(
      'should emits [_FetchDataInProgress, _FetchDataFailure] '
      'when _FetchDataStarted is added and usecase return is failure',
      build: () {
        when(mockUsecase(tId))
            .thenAnswer((_) async => const Left(ServerFailure(failureMessage)));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const EventType.fetchDataStarted(movieId: tId));
      },
      expect: () => const <StateType>[
            StateType.fetchDataInProgress(),
            StateType.fetchDataFailure(failureMessage)
          ],
      verify: (_) {
        verify(mockUsecase(tId)).called(1);
      });
}
