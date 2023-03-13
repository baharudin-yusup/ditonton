import 'dart:convert';

import 'package:ditonton/data/models/tv_show_model.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final json = jsonDecode(readJson('dummy_data/tv_show.json'));

  test('should be a $TvShowModel', () async {
    final result = TvShowModel.fromJson(json);
    expect(result, isA<TvShowModel>());
  });

  test('should equals as a real json', () async {
    final result = TvShowModel.fromJson(json);
    expect(result.toJson(), json);
  });

  test('should equals as a real model', () async {
    final result = TvShowModel.fromJson(json);
    expect(result.copyWith(), result);
  });

  test('should be a subclass of $TvShow entity', () async {
    final result = TvShowModel.fromJson(json);
    expect(result.toEntity(), isA<TvShow>());
  });

  test('should be a subclass of $Watchlist entity', () async {
    final result = TvShowModel.fromJson(json).toEntity();
    expect(result.toWatchlist(), isA<Watchlist>());
  });
}
