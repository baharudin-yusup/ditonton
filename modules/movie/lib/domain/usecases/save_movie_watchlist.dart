import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/movie_detail.dart';
import '../repositories/movie_repository.dart';

class SaveMovieWatchlist {
  final MovieRepository repository;

  SaveMovieWatchlist(this.repository);

  Future<Either<Failure, String>> call(MovieDetail movie) {
    return repository.saveWatchlist(movie);
  }
}
