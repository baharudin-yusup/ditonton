import 'package:core/init.dart' as core;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/init.dart' as movie;
import 'package:movie/movie.dart';

import 'routes_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<RouteSettings>(),
])
void main() {
  late MockRouteSettings mockRouteSettings;

  core.initLocator();
  movie.initLocator();

  setUp(() {
    mockRouteSettings = MockRouteSettings();
  });

  for (var route in [
    MovieDetailPage.routeName,
    MovieRecommendationsPage.routeName,
    NowPlayingMoviesPage.routeName,
    PopularMoviesPage.routeName,
    SearchMoviesPage.routeName,
    TopRatedMoviesPage.routeName,
    'other',
  ]) {
    testWidgets('handle case route = $route', (tester) async {
      when(mockRouteSettings.name).thenReturn(route);
      when(mockRouteSettings.arguments).thenReturn(1);
      final widget = find.byKey(Key(route));
      final page = getMoviePage(mockRouteSettings);

      if (page != null) {
        await tester.pumpWidget(MaterialApp(home: page));
      }

      expect(widget, findsNWidgets(page != null ? 1 : 0));
    });
  }
}
