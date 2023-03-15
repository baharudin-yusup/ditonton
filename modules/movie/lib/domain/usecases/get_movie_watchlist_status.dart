import '../repositories/movie_repository.dart';

class GetMovieWatchlistStatus {
  final MovieRepository repository;

  GetMovieWatchlistStatus(this.repository);

  Future<bool> call(int id) async {
    return await repository.isAddedToWatchlist(id);
  }
}
