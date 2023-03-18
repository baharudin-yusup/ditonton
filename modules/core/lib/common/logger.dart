// coverage:ignore-start
import 'dart:developer';

class Logger {
  static void print(dynamic data) {
    log('$data');
  }

  static void error(
    Object? error, {
    required String event,
  }) {
    log('An error occurred when $event', error: error);
  }
}
// coverage:ignore-end
