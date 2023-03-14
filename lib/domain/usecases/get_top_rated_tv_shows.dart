import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetTopRatedTvShows {
  final TvShowRepository repository;

  GetTopRatedTvShows(this.repository);

  Future<Either<Failure, List<TvShow>>> call([int page = 1]) {
    return repository.getTopRatedTvShows(page);
  }
}
