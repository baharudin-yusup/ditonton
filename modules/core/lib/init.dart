import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/helpers/database_helper.dart';

final locator = GetIt.instance;

void initLocator() {
  /// Helpers
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  /// Externals
  locator.registerLazySingleton(() => http.Client());
}
