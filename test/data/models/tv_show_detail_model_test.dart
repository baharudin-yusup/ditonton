import 'dart:convert';

import 'package:ditonton/data/models/tv_show_detail_model.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final json = jsonDecode(readJson('dummy_data/tv_show_detail.json'));

  test('should be a $TvShowDetailModel', () async {
    final result = TvShowDetailModel.fromJson(json);
    expect(result, isA<TvShowDetailModel>());
  });

  test('should be a subclass of $TvShowDetail entity', () async {
    final result = TvShowDetailModel.fromJson(json);
    expect(result.toEntity(), isA<TvShowDetail>());
  });
}
