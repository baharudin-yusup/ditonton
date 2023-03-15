import 'package:core/init.dart' show locator;
import 'package:core/init.dart' as core;
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/domain/repositories/movie_repository.dart';
import 'package:movie/init.dart' as movie;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    core.initLocator();
    movie.initLocator();
  });
  test('should return not null object', () {
    final client = locator<MovieRepository>();
    expect(client, isNotNull);
  });
}
