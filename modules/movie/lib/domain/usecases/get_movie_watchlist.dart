import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMovieWatchlist {
  final MovieRepository _repository;

  GetMovieWatchlist(this._repository);

  Future<Either<Failure, List<Movie>>> call() {
    return _repository.getWatchlistMovies();
  }
}
