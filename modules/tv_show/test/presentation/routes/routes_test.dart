import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_show/init.dart' as tv_show;
import 'package:tv_show/presentation/pages/pages.dart';
import 'package:tv_show/presentation/routes/routes.dart';

import '../../helpers/test_helper.mocks.dart';
import 'routes_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<RouteSettings>(),
])
void main() {
  late MockRouteSettings mockRouteSettings;
  final mockHttpClient = MockHttpClient();
  final mockDatabaseHelper = MockDatabaseHelper();

  locator.registerLazySingleton<IOClient>(() => mockHttpClient);
  locator.registerLazySingleton<DatabaseHelper>(() => mockDatabaseHelper);

  tv_show.initLocator();

  setUp(() {
    mockRouteSettings = MockRouteSettings();
  });

  for (var route in [
    TvShowDetailPage.routeName,
    TvShowRecommendationsPage.routeName,
    NowAiringTvShowsPage.routeName,
    PopularTvShowsPage.routeName,
    SearchTvShowsPage.routeName,
    TopRatedTvShowsPage.routeName,
    'other',
  ]) {
    testWidgets('handle case route = $route', (tester) async {
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => Response('Not Found', 404));
      when(mockRouteSettings.name).thenReturn(route);
      when(mockRouteSettings.arguments).thenReturn(1);
      final widget = find.byKey(Key(route));
      final page = getTvShowPage(mockRouteSettings);

      if (page != null) {
        await tester.pumpWidget(MaterialApp(home: page));
      }

      expect(widget, page != null ? findsOneWidget : findsNothing);
    });
  }
}
