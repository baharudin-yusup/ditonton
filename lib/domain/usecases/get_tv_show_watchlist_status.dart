import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetTvShowWatchListStatus {
  final TvShowRepository repository;

  GetTvShowWatchListStatus(this.repository);

  Future<bool> call(int id) async {
    return repository.isAddedToWatchlist(id);
  }
}