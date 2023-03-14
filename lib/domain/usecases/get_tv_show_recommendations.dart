import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetTvShowRecommendations {
  final TvShowRepository repository;

  GetTvShowRecommendations(this.repository);

  Future<Either<Failure, List<TvShow>>> call(int id, [int page = 1]) {
    return repository.getTvShowRecommendations(id, page);
  }
}
