import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../json_reader.dart';

typedef ModelType = GenreModel;
typedef EntityType = Genre;

void main() {
  const jsonName = 'genre';
  final json = jsonDecode(readJson('dummy_data/$jsonName.json'));

  test('entity should equals with converted model', () async {
    final result = ModelType.fromJson(json).toEntity();
    expect(testGenre, result);
  });
}
