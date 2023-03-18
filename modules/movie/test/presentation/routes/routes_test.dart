import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../helpers/core_init_helper.dart';
import '../../helpers/test_helper.mocks.dart';
import 'routes_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<RouteSettings>(),
])
void main() {
  mockInitLocator();
  late MockRouteSettings mockRouteSettings;
  final mockHttpClient = MockHttpClient();
  final mockDatabaseHelper = MockDatabaseHelper();

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
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => Response('Not Found', 404));
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
