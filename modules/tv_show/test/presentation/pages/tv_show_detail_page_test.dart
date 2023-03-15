import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_show/presentation/blocs/blocs.dart';
import 'package:tv_show/presentation/pages/pages.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_show_detail_page_test.mocks.dart';

typedef BlocType1 = TvShowDetailBloc;
typedef BlocType2 = TvShowRecommendationsBloc;
typedef BlocType3 = TvShowWatchlistStatusBloc;
typedef BlocType4 = TvShowWatchlistBloc;
typedef BlocState1 = TvShowDetailState;
typedef BlocState2 = TvShowRecommendationsState;
typedef BlocState3 = TvShowWatchlistStatusState;
typedef BlocState4 = TvShowWatchlistState;

typedef XPage = TvShowDetailPage;

@GenerateNiceMocks([
  MockSpec<BlocType1>(as: #MockBlocType1),
  MockSpec<BlocType2>(as: #MockBlocType2),
  MockSpec<BlocType3>(as: #MockBlocType3),
  MockSpec<BlocType4>(as: #MockBlocType4),
])
void main() {
  late MockBlocType1 mockBlocType1;
  late MockBlocType2 mockBlocType2;
  late MockBlocType3 mockBlocType3;
  late MockBlocType4 mockBlocType4;
  late Widget page;

  const tId = 1;
  const errorMessage = '';

  setUp(() {
    mockBlocType1 = MockBlocType1();
    mockBlocType2 = MockBlocType2();
    mockBlocType3 = MockBlocType3();
    mockBlocType4 = MockBlocType4();

    page = MultiBlocProvider(
      providers: [
        BlocProvider<TvShowDetailBloc>(create: (_) => mockBlocType1),
        BlocProvider<TvShowRecommendationsBloc>(create: (_) => mockBlocType2),
        BlocProvider<TvShowWatchlistStatusBloc>(create: (_) => mockBlocType3),
        BlocProvider<TvShowWatchlistBloc>(create: (_) => mockBlocType4),
      ],
      child: const MaterialApp(
        home: XPage(tId),
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

  startTest(int i, int j, int k, int l) {
    testWidgets(
        'handle bloc1 case = $i, '
        'bloc2 case = $j, '
        'bloc3 case = $k, and '
        'bloc4 case = $l', (tester) async {
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
              .thenReturn(BlocState1.fetchDataSuccess(testTvShowDetail));
          break;
        case 3:
          totalFailureWidget++;
          when(mockBlocType1.state)
              .thenReturn(const BlocState1.fetchDataFailure(errorMessage));
          break;
      }

      switch (j) {
        case 0:
          if (totalListCardWidget > 0) totalLoadingWidget++;
          when(mockBlocType2.state).thenReturn(const BlocState2.initial());
          break;
        case 1:
          if (totalListCardWidget > 0) totalLoadingWidget++;
          when(mockBlocType2.state)
              .thenReturn(const BlocState2.fetchDataInProgress());
          break;
        case 2:
          when(mockBlocType2.state)
              .thenReturn(const BlocState2.fetchDataSuccess([]));
          break;
        case 3:
          if (totalListCardWidget > 0) totalFailureWidget++;
          when(mockBlocType2.state)
              .thenReturn(const BlocState2.fetchDataFailure(errorMessage));
          break;
      }

      switch (k) {
        case 0:
          when(mockBlocType3.state).thenReturn(const BlocState3.initial());
          break;
        case 1:
          when(mockBlocType3.state)
              .thenReturn(const BlocState3.fetchDataInProgress());
          break;
        case 2:
          when(mockBlocType3.state)
              .thenReturn(const BlocState3.fetchDataSuccess(true));
          break;
        case 3:
          when(mockBlocType3.state)
              .thenReturn(const BlocState3.fetchDataFailure(errorMessage));
          break;
      }

      switch (l) {
        case 0:
          when(mockBlocType4.state).thenReturn(const BlocState4.initial());
          break;
        case 1:
          when(mockBlocType4.state)
              .thenReturn(const BlocState4.fetchDataInProgress());
          break;
        case 2:
          when(mockBlocType4.state)
              .thenReturn(const BlocState4.fetchDataSuccess([]));
          break;
        case 3:
          when(mockBlocType4.state)
              .thenReturn(const BlocState4.fetchDataFailure(errorMessage));
          break;
      }

      final loadingWidget = find.byKey(kShimmerKey);
      final successWidget = find.byKey(kMainContentsKey);
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
        for (var l = 0; l < 4; l++) {
          startTest(i, j, k, l);
        }
      }
    }
  }
}
