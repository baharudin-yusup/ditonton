import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/tv_show_detail.dart';
import '../repositories/tv_show_repository.dart';

class RemoveTvShowWatchlist {
  final TvShowRepository repository;

  RemoveTvShowWatchlist(this.repository);

  Future<Either<Failure, String>> call(TvShowDetail tvShow) {
    return repository.removeWatchlist(tvShow);
  }
}
