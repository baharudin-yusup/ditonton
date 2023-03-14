import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/tv_show_detail_page.dart';
import 'package:ditonton/presentation/provider/tv_show_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../../modules/core/lib/domain/entities/watchlist.dart';
import '../../dummy_data/dummy_objects.dart';
import 'tv_show_detail_page_test.mocks.dart';

@GenerateMocks([TvShowDetailNotifier])
void main() {
  late MockTvShowDetailNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockTvShowDetailNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvShowDetailNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display bookmark_add_outlined icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(mockNotifier.detailState).thenReturn(RequestState.Loaded);
    when(mockNotifier.detail).thenReturn(testTvShowDetail);
    when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.recommendations).thenReturn(<Watchlist>[]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);

    final watchlistButton = find.byIcon(Icons.bookmark_add_outlined);

    await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: 1)));

    expect(watchlistButton, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display bookmark_added icon when movie is added to watchlist',
      (WidgetTester tester) async {
    when(mockNotifier.detailState).thenReturn(RequestState.Loaded);
    when(mockNotifier.detail).thenReturn(testTvShowDetail);
    when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.recommendations).thenReturn([]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(true);

    final watchlistButtonIcon = find.byIcon(Icons.bookmark_added);

    await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display SnackBar when added to watchlist',
      (WidgetTester tester) async {
    when(mockNotifier.detailState).thenReturn(RequestState.Loaded);
    when(mockNotifier.detail).thenReturn(testTvShowDetail);
    when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.recommendations).thenReturn([]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockNotifier.watchlistMessage).thenReturn('Added to Watchlist');
    when(mockNotifier.toggleWatchlist())
        .thenAnswer((_) async => 'Added to Watchlist');

    final watchlistButton = find.byKey(kWatchlistButtonKey);

    await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: 1)));

    expect(find.byIcon(Icons.bookmark_add_outlined), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(mockNotifier.detailState).thenReturn(RequestState.Loaded);
    when(mockNotifier.detail).thenReturn(testTvShowDetail);
    when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.recommendations).thenReturn([]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockNotifier.watchlistMessage).thenReturn('Failed');
    when(mockNotifier.toggleWatchlist()).thenAnswer((_) async => 'Failed');

    final watchlistButton = find.byKey(kWatchlistButtonKey);

    await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: 1)));

    expect(find.byIcon(Icons.bookmark_add_outlined), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });
}
