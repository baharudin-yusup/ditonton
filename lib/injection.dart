import 'package:core/core.dart';
import 'package:core/init.dart' as core;
import 'package:core/init.dart' show locator;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:movie/init.dart' as movie;
import 'package:tv_show/init.dart' as tv_show;

var _isInitialized = false;

Future<void> init() async {
  if (_isInitialized) {
    return;
  }

  core.initLocator();
  movie.initLocator();
  tv_show.initLocator();

  // External plugin
  final analytics = FirebaseAnalytics.instance;
  final db = await createDb();
  final ioClient = await createIoClient('assets/certificates/themoviedb.pem');

  locator.registerLazySingleton(() => analytics);
  locator.registerLazySingleton(() => db);
  locator.registerLazySingleton(() => ioClient);

  _isInitialized = true;
}
