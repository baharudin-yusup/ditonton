import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/tv_show.dart';
import '../repositories/tv_show_repository.dart';

class GetTvShowWatchlist {
  final TvShowRepository _repository;

  GetTvShowWatchlist(this._repository);

  Future<Either<Failure, List<TvShow>>> call() {
    return _repository.getWatchlistTvShows();
  }
}
