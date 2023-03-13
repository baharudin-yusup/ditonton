import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    required this.id,
    this.originalTitle,
    required this.overview,
    this.popularity,
    required this.posterPath,
    this.releaseDate,
    required this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int id;
  String? originalTitle;
  String overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Watchlist toWatchlist() {
    return Watchlist(
      id: id,
      overview: overview,
      posterPath: posterPath!,
      name: title,
      type: WatchlistType.movie,
    );
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
