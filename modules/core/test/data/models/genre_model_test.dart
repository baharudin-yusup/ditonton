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

  test('should be a $ModelType', () async {
    final result = ModelType.fromJson(json);
    expect(result, isA<ModelType>());
  });

  test('should equals as a real json', () async {
    final result = ModelType.fromJson(json);
    expect(result.toJson(), json);
  });

  test('should return an entity', () async {
    final result = ModelType.fromJson(json);
    expect(result.toEntity(), isA<EntityType>());
  });

  test('should equals with predefined model', () async {
    final result = ModelType.fromJson(json);
    expect(result, testGenreModel);
  });
}
