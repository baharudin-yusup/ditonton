import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/init.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_show/domain/usecases/usecases.dart';
import 'package:tv_show/presentation/blocs/tv_show_detail/tv_show_detail_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/core_init_helper.dart';
import 'tv_show_detail_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetTvShowDetail>()])
void main() {
  mockInitLocator();
  late MockGetTvShowDetail mockGetTvShowDetail;
  late TvShowDetailBloc bloc;
  setUp(() {
    mockGetTvShowDetail = MockGetTvShowDetail();
    bloc = TvShowDetailBloc(mockGetTvShowDetail, locator());
  });

  const tId = 1;

  blocTest<TvShowDetailBloc, TvShowDetailState>(
    'should emits [] '
    'when nothing is added',
    build: () => bloc,
    expect: () => [],
  );

  blocTest<TvShowDetailBloc, TvShowDetailState>(
      'should emits [_FetchDataInProgress, _FetchDataSuccess] '
      'when _FetchDataStarted is added and usecase return is failure',
      build: () {
        when(mockGetTvShowDetail(tId))
            .thenAnswer((_) async => Right(testTvShowDetail));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const TvShowDetailEvent.fetchDataStarted(tId));
      },
      expect: () => <TvShowDetailState>[
            const TvShowDetailState.fetchDataInProgress(),
            TvShowDetailState.fetchDataSuccess(testTvShowDetail)
          ],
      verify: (_) {
        verify(mockGetTvShowDetail(tId)).called(1);
      });

  blocTest<TvShowDetailBloc, TvShowDetailState>(
      'should emits [_FetchDataInProgress, _FetchDataFailure] '
      'when _FetchDataStarted is added and usecase return is failure',
      build: () {
        when(mockGetTvShowDetail(tId))
            .thenAnswer((_) async => const Left(ServerFailure('')));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const TvShowDetailEvent.fetchDataStarted(tId));
      },
      expect: () => const <TvShowDetailState>[
            TvShowDetailState.fetchDataInProgress(),
            TvShowDetailState.fetchDataFailure('')
          ],
      verify: (_) {
        verify(mockGetTvShowDetail(tId)).called(1);
      });
}
