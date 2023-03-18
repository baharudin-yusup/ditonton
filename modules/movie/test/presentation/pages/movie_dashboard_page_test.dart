import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import 'movie_dashboard_page_test.mocks.dart';

typedef BlocType1 = NowPlayingMoviesBloc;
typedef BlocType2 = PopularMoviesBloc;
typedef BlocType3 = TopRatedMoviesBloc;
typedef BlocState1 = NowPlayingMoviesState;
typedef BlocState2 = PopularMoviesState;
typedef BlocState3 = TopRatedMoviesState;

typedef XPage = MovieDashboardPage;

@GenerateNiceMocks([
  MockSpec<BlocType1>(as: #MockBlocType1),
  MockSpec<BlocType2>(as: #MockBlocType2),
  MockSpec<BlocType3>(as: #MockBlocType3),
])
void main() {
  late MockBlocType1 mockBlocType1;
  late MockBlocType2 mockBlocType2;
  late MockBlocType3 mockBlocType3;
  late Widget page;

  const errorMessage = '';

  setUp(() {
    mockBlocType1 = MockBlocType1();
    mockBlocType2 = MockBlocType2();
    mockBlocType3 = MockBlocType3();

    page = MultiBlocProvider(
      providers: [
        BlocProvider<NowPlayingMoviesBloc>(create: (_) => mockBlocType1),
        BlocProvider<PopularMoviesBloc>(create: (_) => mockBlocType2),
        BlocProvider<TopRatedMoviesBloc>(create: (_) => mockBlocType3),
      ],
      child: const MaterialApp(
        home: XPage(),
      ),
    );
  });

  int getTotalLoadingWidget(int i, int j, int k) {
    int totalLoadingWidget = 0;

    if (i < 2) {
      totalLoadingWidget++;
    }
    if (j < 2) {
      totalLoadingWidget++;
    }
    if (k < 2) {
      totalLoadingWidget++;
    }

    return totalLoadingWidget;
  }

  int getTotalListCardWidget(int i, int j, int k) {
    int totalWidget = 0;

    if (i == 2) {
      totalWidget++;
    }
    if (j == 2) {
      totalWidget++;
    }
    if (k == 2) {
      totalWidget++;
    }

    return totalWidget;
  }

  int getTotalFailureWidget(int i, int j, int k) {
    int totalWidget = 0;

    if (i == 3) {
      totalWidget++;
    }
    if (j == 3) {
      totalWidget++;
    }
    if (k == 3) {
      totalWidget++;
    }

    return totalWidget;
  }

  startTest(int i, int j, int k) {
    testWidgets(
        'should return total loading widget = ${getTotalLoadingWidget(i, j, k)}, '
        'and total success widget = ${getTotalListCardWidget(i, j, k)}, '
        'and total failure widget = ${getTotalFailureWidget(i, j, k)}',
        (tester) async {
      int totalLoadingWidget = 0;
      int totalListCardWidget = 0;
      int totalFailureWidget = 0;
      switch (i) {
        case 0:
          totalLoadingWidget++;
          when(mockBlocType1.state).thenReturn(const BlocState1.initial());
          break;
        case 1:
          totalLoadingWidget++;
          when(mockBlocType1.state)
              .thenReturn(const BlocState1.fetchDataInProgress());
          break;
        case 2:
          totalListCardWidget++;
          when(mockBlocType1.state)
              .thenReturn(const BlocState1.fetchDataSuccess([]));
          break;
        case 3:
          totalFailureWidget++;
          when(mockBlocType1.state)
              .thenReturn(const BlocState1.fetchDataFailure(errorMessage));
          break;
      }

      switch (j) {
        case 0:
          totalLoadingWidget++;
          when(mockBlocType2.state).thenReturn(const BlocState2.initial());
          break;
        case 1:
          totalLoadingWidget++;
          when(mockBlocType2.state)
              .thenReturn(const BlocState2.fetchDataInProgress());
          break;
        case 2:
          totalListCardWidget++;
          when(mockBlocType2.state)
              .thenReturn(const BlocState2.fetchDataSuccess([]));
          break;
        case 3:
          totalFailureWidget++;
          when(mockBlocType2.state)
              .thenReturn(const BlocState2.fetchDataFailure(errorMessage));
          break;
      }

      switch (k) {
        case 0:
          totalLoadingWidget++;
          when(mockBlocType3.state).thenReturn(const BlocState3.initial());
          break;
        case 1:
          totalLoadingWidget++;
          when(mockBlocType3.state)
              .thenReturn(const BlocState3.fetchDataInProgress());
          break;
        case 2:
          totalListCardWidget++;
          when(mockBlocType3.state)
              .thenReturn(const BlocState3.fetchDataSuccess([]));
          break;
        case 3:
          totalFailureWidget++;
          when(mockBlocType3.state)
              .thenReturn(const BlocState3.fetchDataFailure(errorMessage));
          break;
      }

      final loadingWidget = find.byKey(kShimmerKey);
      final successWidget = find.byKey(kEntertainmentHorizontalListKey);
      final failureWidget = find.byKey(kErrorTextKey);

      await tester.pumpWidget(page);

      expect(loadingWidget, findsNWidgets(totalLoadingWidget));
      expect(successWidget, findsNWidgets(totalListCardWidget));
      expect(failureWidget, findsNWidgets(totalFailureWidget));
    });
  }

  for (var i = 0; i < 4; i++) {
    for (var j = 0; j < 4; j++) {
      for (var k = 0; k < 4; k++) {
        startTest(i, j, k);
      }
    }
  }
}
