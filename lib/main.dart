// coverage:ignore-start
import 'package:core/core.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:flutter/widgets.dart';

import 'presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await locator<DatabaseHelper>().init();

  runApp(App());
}
// coverage:ignore-end
