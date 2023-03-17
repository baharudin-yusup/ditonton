import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/movie_detail.dart';
import '../repositories/movie_repository.dart';

class RemoveMovieWatchlist {
  final MovieRepository repository;

  RemoveMovieWatchlist(this.repository);

  Future<Either<Failure, String>> call(MovieDetail movie) {
    return repository.removeWatchlist(movie);
  }
}
