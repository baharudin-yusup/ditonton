import '../repositories/movie_repository.dart';

class GetMovieWatchListStatus {
  final MovieRepository repository;

  GetMovieWatchListStatus(this.repository);

  Future<bool> call(int id) async {
    return await repository.isAddedToWatchlist(id);
  }
}
