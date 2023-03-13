import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/widgets/base/entertainment_card/entertainment_card.dart';
import 'package:ditonton/presentation/widgets/entertainment_horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: body,
    );
  }

  testWidgets('Should display shimmer when state is not ${RequestState.Loaded}',
      (WidgetTester tester) async {
    final state = RequestState.Loading;
    final shimmerUi = find.byKey(kShimmerKey);

    await tester.pumpWidget(
        _makeTestableWidget(EntertainmentHorizontalList(testWatchlist, state)));

    expect(shimmerUi, findsNWidgets(5));
  });

  testWidgets(
      'Should display $EntertainmentCard when state is ${RequestState.Loaded}',
      (tester) async {
    final state = RequestState.Loaded;
    final card = find.byKey(kSimpleEntertainmentCardKey);

    await tester.pumpWidget(
        _makeTestableWidget(EntertainmentHorizontalList(testWatchlist, state)));

    expect(card, findsNWidgets(testWatchlist.length));
  });
}
