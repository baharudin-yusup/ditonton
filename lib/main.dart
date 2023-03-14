import 'package:ditonton/injection.dart' as di;
import 'package:flutter/widgets.dart';

import 'presentation/app.dart';

void main() {
  di.init();
  runApp(App());
}
