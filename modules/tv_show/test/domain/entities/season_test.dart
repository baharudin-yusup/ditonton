import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tv_show/data/models/models.dart';
import 'package:tv_show/domain/entities/entities.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../json_reader.dart';

typedef ModelType = SeasonModel;
typedef EntityType = Season;

void main() {
  const jsonName = 'season';
  final json = jsonDecode(readJson('dummy_data/$jsonName.json'));

  test('entity should equals with converted model', () async {
    final result = ModelType.fromJson(json).toEntity();
    expect(testSeason, result);
  });
}
