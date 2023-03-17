import 'package:flutter_test/flutter_test.dart';
import 'package:tv_show/data/models/models.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  final tMovieModel = testTvShowModel;

  final tMovie = tMovieModel.toEntity();

  test('should be a subclass of Movie entity', () async {
    final result = tMovieModel.toEntity();
    expect(result, tMovie);
  });
}
