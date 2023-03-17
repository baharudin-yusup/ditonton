// coverage:ignore-start
import 'package:core/core.dart';
import 'package:http/io_client.dart';
import 'package:movie/init.dart' as movie;
import 'package:tv_show/init.dart' as tv_show;

var _isInitialized = false;

Future<void> init() async {
  if (_isInitialized) {
    return;
  }

  movie.initLocator();
  tv_show.initLocator();

  final db = await createDb();
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelperImpl(db));

  final ioClient = await createIoClient('assets/certificates/themoviedb.pem');
  locator.registerLazySingleton<IOClient>(() => ioClient);

  _isInitialized = true;
}
// coverage:ignore-end
