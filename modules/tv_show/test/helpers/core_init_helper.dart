import 'package:core/init.dart' as core;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tv_show/init.dart' as tv_show;

import 'core_init_helper.mocks.dart';

@GenerateMocks([
  FirebaseAnalytics,
  Database,
  IOClient,
])
MockIOClient mockIOClient = MockIOClient();
void mockInitLocator() async {
  core.initLocator();
  tv_show.initLocator();

  core.locator
      .registerLazySingleton<FirebaseAnalytics>(() => MockFirebaseAnalytics());
  core.locator.registerLazySingleton<Database>(() => MockDatabase());
  core.locator.registerLazySingleton<IOClient>(() => mockIOClient);
}
