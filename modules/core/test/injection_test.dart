import 'package:core/init.dart' show locator;
import 'package:core/init.dart' as core;
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    core.initLocator();
  });
  test('should return not null object', () {
    final client = locator<Client>();
    expect(client, isNotNull);
  });
}
