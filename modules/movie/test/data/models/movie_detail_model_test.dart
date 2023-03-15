import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie/data/models/models.dart';
import 'package:movie/domain/entities/movie_detail.dart';

import '../../json_reader.dart';

void main() {
  final json = jsonDecode(readJson('dummy_data/movie_detail.json'));

  test('should be a $MovieDetailModel', () async {
    final result = MovieDetailModel.fromJson(json);
    expect(result, isA<MovieDetailModel>());
  });

  test('should be a subclass of $MovieDetail entity', () async {
    final result = MovieDetailModel.fromJson(json);
    expect(result.toEntity(), isA<MovieDetail>());
  });
}
