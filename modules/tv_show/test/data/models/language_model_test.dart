import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tv_show/data/models/models.dart';

import '../../json_reader.dart';

typedef ModelType = LanguageModel;

void main() {
  const jsonName = 'language';
  final json = jsonDecode(readJson('dummy_data/$jsonName.json'));

  test('should be a $ModelType', () async {
    final result = ModelType.fromJson(json);
    expect(result, isA<ModelType>());
  });

  test('should equals as a real json', () async {
    final result = ModelType.fromJson(json);
    expect(result.toJson(), json);
  });

  test('should equals as a real model', () async {
    final result = ModelType.fromJson(json);
    expect(result.copyWith(), result);
  });
}
