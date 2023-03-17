import 'package:core/core.dart';

class MovieDetail extends Watchlist {
  const MovieDetail({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required super.id,
    required this.originalTitle,
    required super.overview,
    required super.posterPath,
    required this.releaseDate,
    required this.runtime,
    required super.name,
    required this.voteAverage,
    required this.voteCount,
  }) : super(type: WatchlistType.movie);

  final bool adult;
  final String? backdropPath;
  final List<Genre> genres;
  final String originalTitle;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        ...super.props,
        adult,
        backdropPath,
        genres,
        originalTitle,
        releaseDate,
        voteAverage,
        voteCount,
      ];
}
