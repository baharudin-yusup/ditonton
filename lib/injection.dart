import 'package:core/init.dart' as core;
import 'package:movie/init.dart' as movie;
import 'package:tv_show/init.dart' as tv_show;

var _isInitialized = false;

void init() {
  if (_isInitialized) {
    return;
  }

  core.initLocator();
  movie.initLocator();
  tv_show.initLocator();

  _isInitialized = true;
}
