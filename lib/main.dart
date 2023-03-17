// coverage:ignore-start
import 'package:ditonton/injection.dart' as di;
import 'package:flutter/widgets.dart';

import 'presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(App());
}
// coverage:ignore-end
