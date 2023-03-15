import 'package:bloc_test/bloc_test.dart';
import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_show/domain/usecases/usecases.dart';
import 'package:tv_show/presentation/blocs/blocs.dart';

import '../../dummy_data/dummy_objects.dart';
import 'search_tv_shows_bloc_test.mocks.dart';

typedef BlocType = SearchTvShowsBloc;
typedef StateType = SearchTvShowsState;
typedef EventType = SearchTvShowsEvent;
typedef UsecaseType = SearchTvShows;

@GenerateNiceMocks([MockSpec<UsecaseType>(as: #MockUsecase)])
void main() {
  late MockUsecase mockUsecase;
  late BlocType bloc;
  setUp(() {
    mockUsecase = MockUsecase();
    bloc = BlocType(mockUsecase);
  });

  const query = 'Spider';
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
        when(mockUsecase(query)).thenAnswer((_) async => Right(successData));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const EventType.searchDataStarted(query: query));
      },
      expect: () => <StateType>[
            const StateType.searchDataInProgress(),
            StateType.searchDataSuccess(successData)
          ],
      verify: (_) {
        verify(mockUsecase(query)).called(1);
      });

  blocTest<BlocType, StateType>(
      'should emits [_FetchDataInProgress, _FetchDataFailure] '
      'when _FetchDataStarted is added and usecase return is failure',
      build: () {
        when(mockUsecase(query))
            .thenAnswer((_) async => const Left(ServerFailure(failureMessage)));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const EventType.searchDataStarted(query: query));
      },
      expect: () => const <StateType>[
            StateType.searchDataInProgress(),
            StateType.searchDataFailure(failureMessage)
          ],
      verify: (_) {
        verify(mockUsecase(query)).called(1);
      });
}
