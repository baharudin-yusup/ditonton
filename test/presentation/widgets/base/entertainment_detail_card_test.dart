import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/presentation/widgets/base/entertainment_card/entertainment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy_data/dummy_objects.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: body,
    );
  }

  testWidgets(
      'Should display "TV Show" info text when the type is ${WatchlistType.movie}',
      (WidgetTester tester) async {
    final infoText = find.text('Movie');

    await tester.pumpWidget(_makeTestableWidget(
        EntertainmentCard.detailed(testMovie.toWatchlist())));

    expect(infoText, findsOneWidget);
  });

  testWidgets(
      'Should display "Movie" info text when the type is ${WatchlistType.tvShow}',
      (WidgetTester tester) async {
    final infoText = find.text('TV Show');

    await tester.pumpWidget(_makeTestableWidget(
        EntertainmentCard.detailed(testTvShow.toWatchlist())));

    expect(infoText, findsOneWidget);
  });
}
