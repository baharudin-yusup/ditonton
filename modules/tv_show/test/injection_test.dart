import 'package:core/init.dart' show locator;
import 'package:core/init.dart' as core;
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_show/domain/repositories/tv_show_repository.dart';
import 'package:tv_show/init.dart' as tv_show;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    core.initLocator();
    tv_show.initLocator();
  });
  test('should return not null object', () {
    final client = locator<TvShowRepository>();
    expect(client, isNotNull);
  });
}
