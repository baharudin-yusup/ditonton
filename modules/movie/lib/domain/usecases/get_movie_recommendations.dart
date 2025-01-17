import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMovieRecommendations {
  final MovieRepository repository;

  GetMovieRecommendations(this.repository);

  Future<Either<Failure, List<Movie>>> call(id, [int page = 1]) {
    return repository.getMovieRecommendations(id);
  }
}
