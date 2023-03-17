import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_watchlist_page_test.mocks.dart';

typedef BlocType1 = MovieWatchlistBloc;
typedef BlocState1 = MovieWatchlistState;

typedef XPage = MovieWatchlistPage;

@GenerateNiceMocks([
  MockSpec<BlocType1>(as: #MockBlocType1),
])
void main() {
  late MockBlocType1 mockBlocType1;
  late Widget page;

  const tId = 1;
  const errorMessage = '';

  setUp(() {
    mockBlocType1 = MockBlocType1();

    page = MultiBlocProvider(
      providers: [
        BlocProvider<MovieWatchlistBloc>(create: (_) => mockBlocType1),
      ],
      child: const MaterialApp(
        home: XPage(),
      ),
    );
  });

  startTest(int i) {
    testWidgets('handle bloc1 case = $i', (tester) async {
      int totalInitialWidget = 0;
      int totalLoadingWidget = 0;
      int totalListCardWidget = 0;
      int totalFailureWidget = 0;
      switch (i) {
        case 0:
          totalInitialWidget++;
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
              .thenReturn(const BlocState1.fetchDataSuccess(testWatchlist));
          break;
        case 3:
          totalFailureWidget++;
          when(mockBlocType1.state)
              .thenReturn(const BlocState1.fetchDataFailure(errorMessage));
          break;
      }

      final initialWidget = find.byKey(kInitialWidgetKey);
      final loadingWidget = find.byKey(kShimmerKey);
      final successWidget = find.byKey(kMainContentsKey);
      final failureWidget = find.byKey(kErrorTextKey);

      await tester.pumpWidget(page);

      expect(initialWidget, findsNWidgets(totalInitialWidget));
      expect(loadingWidget, findsNWidgets(totalLoadingWidget));
      expect(successWidget, findsNWidgets(totalListCardWidget));
      expect(failureWidget, findsNWidgets(totalFailureWidget));
    });
  }

  for (var i = 0; i < 4; i++) {
    startTest(i);
  }
}
