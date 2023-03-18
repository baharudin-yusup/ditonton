import 'package:core/core.dart';
import 'package:core/init.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/io_client.dart';
import 'package:tv_show/domain/repositories/tv_show_repository.dart';
import 'package:tv_show/init.dart' as tv_show;

import 'helpers/test_helper.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final mockHttpClient = MockHttpClient();
  final mockDatabaseHelper = MockDatabaseHelper();

  locator.registerLazySingleton<IOClient>(() => mockHttpClient);
  locator.registerLazySingleton<DatabaseHelper>(() => mockDatabaseHelper);
  tv_show.initLocator();
  test('should return not null object', () {
    final client = locator<TvShowRepository>();
    expect(client, isNotNull);
  });
}
