import 'package:core/init.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_show/domain/repositories/tv_show_repository.dart';

import 'helpers/core_init_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  mockInitLocator();

  test('should return not null object', () {
    final client = locator<TvShowRepository>();
    expect(client, isNotNull);
  });
}
