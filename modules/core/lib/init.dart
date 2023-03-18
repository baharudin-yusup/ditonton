import 'package:get_it/get_it.dart';

import 'core.dart';

final locator = GetIt.instance;

void initLocator() {
  final locator = GetIt.instance;

  // Usecases
  locator.registerLazySingleton(() => LogSelectedContent(locator()));

  // Repositories
  locator.registerLazySingleton<AnalyticRepository>(
      () => AnalyticRepositoryImpl(locator()));

  // Data sources
  locator.registerLazySingleton<AnalyticRemoteDataSource>(
      () => AnalyticRemoteDataSourceImpl(locator()));

  // Helpers
  locator.registerLazySingleton<DatabaseHelper>(
      () => DatabaseHelperImpl(locator()));
}
