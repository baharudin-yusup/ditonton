import 'package:core/core.dart';
import 'package:core/init.dart' as core;
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:movie/init.dart' as movie;

import 'core_init_helper.mocks.dart';

@GenerateMocks([
  LogSelectedContent,
  AnalyticRepository,
  AnalyticRemoteDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<IOClient>(as: #MockHttpClient)
])
void mockInitLocator() {
  movie.initLocator();

  locator.registerLazySingleton<LogSelectedContent>(
      () => MockLogSelectedContent());
  locator.registerLazySingleton<AnalyticRepository>(
      () => MockAnalyticRepository());
  locator.registerLazySingleton<AnalyticRemoteDataSource>(
      () => MockAnalyticRemoteDataSource());
  locator.registerLazySingleton<DatabaseHelper>(() => MockDatabaseHelper());
  locator.registerLazySingleton<IOClient>(() => MockHttpClient());
}

final locator = core.locator;
