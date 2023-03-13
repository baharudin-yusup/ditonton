import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetTvShowWatchlist {
  final TvShowRepository _repository;

  GetTvShowWatchlist(this._repository);

  Future<Either<Failure, List<TvShow>>> call() {
    return _repository.getWatchlistTvShows();
  }
}
