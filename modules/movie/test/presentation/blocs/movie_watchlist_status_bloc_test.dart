import 'package:bloc_test/bloc_test.dart';
import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_watchlist_status_bloc_test.mocks.dart';

typedef BlocType = MovieWatchlistStatusBloc;
typedef StateType = MovieWatchlistStatusState;
typedef EventType = MovieWatchlistStatusEvent;
typedef UsecaseType1 = GetMovieWatchlistStatus;
typedef UsecaseType2 = SaveMovieWatchlist;
typedef UsecaseType3 = RemoveMovieWatchlist;
typedef WatchlistBlocType = MovieWatchlistBloc;

@GenerateNiceMocks([
  MockSpec<UsecaseType1>(as: #MockUsecase1),
  MockSpec<UsecaseType2>(as: #MockUsecase2),
  MockSpec<UsecaseType3>(as: #MockUsecase3),
  MockSpec<WatchlistBlocType>(as: #MockWatchlistBloc),
])
void main() {
  late MockUsecase1 mockUsecase1;
  late MockUsecase2 mockUsecase2;
  late MockUsecase3 mockUsecase3;
  late MockWatchlistBloc mockWatchlistBloc;
  late BlocType bloc;
  setUp(() {
    mockUsecase1 = MockUsecase1();
    mockUsecase2 = MockUsecase2();
    mockUsecase3 = MockUsecase3();
    mockWatchlistBloc = MockWatchlistBloc();
    bloc = BlocType(
      mockUsecase1,
      mockUsecase2,
      mockUsecase3,
      mockWatchlistBloc,
    );
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
        when(mockUsecase1(tId)).thenAnswer((_) async => true);
        return bloc;
      },
      act: (bloc) {
        bloc.add(const EventType.fetchDataStarted(tId));
      },
      expect: () => <StateType>[
            const StateType.fetchDataInProgress(),
            const StateType.fetchDataSuccess(true)
          ],
      verify: (_) {
        verify(mockUsecase1(tId)).called(1);
      });

  group('Toggle watchlist', () {
    const successMessage = 'success';
    const failureMessage = 'failure';
    void mockProcess({
      bool isAddedToWatchlist = true,
      bool isUpdateSuccess = true,
    }) {
      when(mockUsecase1(testMovieDetail.id))
          .thenAnswer((_) async => isAddedToWatchlist);

      if (isAddedToWatchlist) {
        when(mockUsecase3(testMovieDetail)).thenAnswer((_) async =>
            isUpdateSuccess
                ? const Right(successMessage)
                : const Left(ServerFailure(failureMessage)));
      } else {
        when(mockUsecase2(testMovieDetail)).thenAnswer((_) async =>
            isUpdateSuccess
                ? const Right(successMessage)
                : const Left(ServerFailure(failureMessage)));
      }
    }

    blocTest<BlocType, StateType>(
        'should emits [_FetchDataInProgress, _FetchDataSuccess] '
        'and do remove watchlist'
        'when _ToggleWatchlistStarted is added, '
        'isAddedToWatchlist is true, '
        'and all process is successful',
        build: () {
          mockProcess(isAddedToWatchlist: true, isUpdateSuccess: true);
          return bloc;
        },
        act: (bloc) {
          bloc.add(const EventType.toggleWatchlistStarted(testMovieDetail));
        },
        expect: () => <StateType>[
              const StateType.fetchDataInProgress(),
              const StateType.fetchDataSuccess(false, message: successMessage)
            ],
        verify: (_) {
          verify(mockUsecase1(testMovieDetail.id)).called(1);
          verify(mockUsecase3(testMovieDetail)).called(1);
          verifyZeroInteractions(mockUsecase2);
        });
    blocTest<BlocType, StateType>(
        'should emits [_FetchDataInProgress, _FetchDataSuccess] '
        'and do add watchlist '
        'when _ToggleWatchlistStarted is added, '
        'isAddedToWatchlist is false, '
        'and all process is successful',
        build: () {
          mockProcess(isAddedToWatchlist: false, isUpdateSuccess: true);
          return bloc;
        },
        act: (bloc) {
          bloc.add(const EventType.toggleWatchlistStarted(testMovieDetail));
        },
        expect: () => <StateType>[
              const StateType.fetchDataInProgress(),
              const StateType.fetchDataSuccess(true, message: successMessage)
            ],
        verify: (_) {
          verify(mockUsecase1(testMovieDetail.id)).called(1);
          verify(mockUsecase2(testMovieDetail)).called(1);
          verifyZeroInteractions(mockUsecase3);
        });

    blocTest<BlocType, StateType>(
        'should emits [_FetchDataInProgress, _FetchDataFailure] '
        'and do remove watchlist'
        'when _ToggleWatchlistStarted is added, '
        'isAddedToWatchlist is true, '
        'and all process is failure',
        build: () {
          mockProcess(isAddedToWatchlist: true, isUpdateSuccess: false);
          return bloc;
        },
        act: (bloc) {
          bloc.add(const EventType.toggleWatchlistStarted(testMovieDetail));
        },
        expect: () => <StateType>[
              const StateType.fetchDataInProgress(),
              const StateType.fetchDataFailure(failureMessage)
            ],
        verify: (_) {
          verify(mockUsecase1(testMovieDetail.id)).called(1);
          verify(mockUsecase3(testMovieDetail)).called(1);
          verifyZeroInteractions(mockUsecase2);
        });

    blocTest<BlocType, StateType>(
        'should emits [_FetchDataInProgress, _FetchDataFailure] '
        'and do add watchlist '
        'when _ToggleWatchlistStarted is added, '
        'isAddedToWatchlist is false, '
        'and all process is failure',
        build: () {
          mockProcess(isAddedToWatchlist: false, isUpdateSuccess: false);
          return bloc;
        },
        act: (bloc) {
          bloc.add(const EventType.toggleWatchlistStarted(testMovieDetail));
        },
        expect: () => <StateType>[
              const StateType.fetchDataInProgress(),
              const StateType.fetchDataFailure(failureMessage)
            ],
        verify: (_) {
          verify(mockUsecase1(testMovieDetail.id)).called(1);
          verify(mockUsecase2(testMovieDetail)).called(1);
          verifyZeroInteractions(mockUsecase3);
        });
  });
}
