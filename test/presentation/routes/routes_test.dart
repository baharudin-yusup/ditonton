import 'package:ditonton/injection.dart';
import 'package:ditonton/presentation/pages/pages.dart';
import 'package:ditonton/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'routes_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<RouteSettings>(),
])
void main() async {
  late MockRouteSettings mockRouteSettings;
  init();

  setUp(() {
    mockRouteSettings = MockRouteSettings();
  });

  for (var route in [
    HomePage.routeName,
    'other',
  ]) {
    testWidgets('handle case route = $route', (tester) async {
      when(mockRouteSettings.name).thenReturn(route);
      when(mockRouteSettings.arguments).thenReturn(1);
      final widget = find.byKey(Key(route));
      final page = getGeneralPage(mockRouteSettings);

      await tester.pumpWidget(MaterialApp(home: page));

      switch (route) {
        case HomePage.routeName:
          expect(widget, findsOneWidget);
          break;
        default:
          expect(widget, findsNothing);
          break;
      }
    });
  }
}
