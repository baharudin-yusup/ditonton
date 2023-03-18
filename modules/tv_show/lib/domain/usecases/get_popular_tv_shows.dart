import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/tv_show.dart';
import '../repositories/tv_show_repository.dart';

class GetPopularTvShows {
  final TvShowRepository repository;

  GetPopularTvShows(this.repository);

  Future<Either<Failure, List<TvShow>>> call([int page = 1]) {
    return repository.getPopularTvShows(page);
  }
}
