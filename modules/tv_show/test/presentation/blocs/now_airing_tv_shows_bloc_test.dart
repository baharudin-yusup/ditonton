import 'package:bloc_test/bloc_test.dart';
import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_show/domain/usecases/usecases.dart';
import 'package:tv_show/presentation/blocs/blocs.dart';

import '../../dummy_data/dummy_objects.dart';
import 'now_airing_tv_shows_bloc_test.mocks.dart';

typedef BlocType = NowAiringTvShowsBloc;
typedef StateType = NowAiringTvShowsState;
typedef EventType = NowAiringTvShowsEvent;
typedef UsecaseType = GetNowAiringTvShows;

@GenerateNiceMocks([MockSpec<UsecaseType>(as: #MockUsecase)])
void main() {
  late MockUsecase mockUsecase;
  late BlocType bloc;
  setUp(() {
    mockUsecase = MockUsecase();
    bloc = BlocType(mockUsecase);
  });

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
        when(mockUsecase()).thenAnswer((_) async => Right(successData));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const EventType.fetchDataStarted());
      },
      expect: () => <StateType>[
            const StateType.fetchDataInProgress(),
            StateType.fetchDataSuccess(successData)
          ],
      verify: (_) {
        verify(mockUsecase()).called(1);
      });

  blocTest<BlocType, StateType>(
      'should emits [_FetchDataInProgress, _FetchDataFailure] '
      'when _FetchDataStarted is added and usecase return is failure',
      build: () {
        when(mockUsecase())
            .thenAnswer((_) async => const Left(ServerFailure(failureMessage)));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const EventType.fetchDataStarted());
      },
      expect: () => const <StateType>[
            StateType.fetchDataInProgress(),
            StateType.fetchDataFailure(failureMessage)
          ],
      verify: (_) {
        verify(mockUsecase()).called(1);
      });
}
