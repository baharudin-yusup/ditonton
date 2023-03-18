import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tv_show/data/models/models.dart';

import '../../json_reader.dart';

void main() {
  final json = jsonDecode(readJson('dummy_data/tv_show_response.json'));

  test('should be a $TvShowResponse', () async {
    final result = TvShowResponse.fromJson(json);
    expect(result, isA<TvShowResponse>());
  });

  test('should equals as a real json', () async {
    final result = TvShowResponse.fromJson(json);
    expect(result.toJson(), json);
  });

  test('should equals as a real model', () async {
    final result = TvShowResponse.fromJson(json);
    expect(result.copyWith(), result);
  });
}
