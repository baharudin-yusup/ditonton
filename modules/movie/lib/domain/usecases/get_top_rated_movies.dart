import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call([int page = 1]) {
    return repository.getTopRatedMovies();
  }
}
