import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/tv_show.dart';
import '../repositories/tv_show_repository.dart';

class SearchTvShows {
  final TvShowRepository repository;

  SearchTvShows(this.repository);

  Future<Either<Failure, List<TvShow>>> call(String query, [int page = 1]) {
    return repository.searchTvShows(query, page);
  }
}
