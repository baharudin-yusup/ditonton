import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';

import '../../common/failure.dart';

abstract class TvShowRepository {
  Future<Either<Failure, List<TvShow>>> getNowAiringTvShows([int page = 1]);

  Future<Either<Failure, List<TvShow>>> getPopularTvShows([int page = 1]);

  Future<Either<Failure, List<TvShow>>> getTopRatedTvShows([int page = 1]);

  Future<Either<Failure, TvShowDetail>> getTvShowDetail(int id);

  Future<Either<Failure, List<TvShow>>> getTvShowRecommendations(int id,
      [int page = 1]);

  Future<Either<Failure, List<TvShow>>> searchTvShows(String query,
      [int page = 1]);

  Future<Either<Failure, String>> saveWatchlist(TvShowDetail tvShow);

  Future<Either<Failure, String>> removeWatchlist(TvShowDetail tvShow);

  Future<bool> isAddedToWatchlist(int id);

  Future<Either<Failure, List<TvShow>>> getWatchlistTvShows();
}
