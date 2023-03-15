import '../repositories/tv_show_repository.dart';

class GetTvShowWatchlistStatus {
  final TvShowRepository repository;

  GetTvShowWatchlistStatus(this.repository);

  Future<bool> call(int id) async {
    return repository.isAddedToWatchlist(id);
  }
}
