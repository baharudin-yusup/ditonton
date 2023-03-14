import 'package:ditonton/injection.dart' as di;
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:movie/presentation/blocs/movie_list_notifier.dart';

void main() {
  setUp(() {
    di.init();
  });
  test('should return not null object', () {
    final client = di.locator<http.Client>();
    expect(client, isA<http.Client>());
  });

  test('should return registered is true', () {
    expect(di.locator.isRegistered<MovieListNotifier>(), true);
  });
}
