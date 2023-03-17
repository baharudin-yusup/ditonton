import 'package:bloc_test/bloc_test.dart';
import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_show/domain/usecases/usecases.dart';
import 'package:tv_show/presentation/blocs/blocs.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_show_recommendations_bloc_test.mocks.dart';

typedef BlocType = TvShowRecommendationsBloc;
typedef StateType = TvShowRecommendationsState;
typedef EventType = TvShowRecommendationsEvent;

@GenerateNiceMocks([MockSpec<GetTvShowRecommendations>()])
void main() {
  late MockGetTvShowRecommendations mockUsecase;
  late TvShowRecommendationsBloc bloc;
  setUp(() {
    mockUsecase = MockGetTvShowRecommendations();
    bloc = TvShowRecommendationsBloc(mockUsecase);
  });

  const tId = 1;
  final successData = testTvShowList;
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
        bloc.add(const EventType.fetchDataStarted(tId));
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
        bloc.add(const EventType.fetchDataStarted(tId));
      },
      expect: () => const <StateType>[
            StateType.fetchDataInProgress(),
            StateType.fetchDataFailure(failureMessage)
          ],
      verify: (_) {
        verify(mockUsecase(tId)).called(1);
      });
}
