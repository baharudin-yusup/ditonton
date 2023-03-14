import 'package:core/domain/entities/watchlist.dart';

class Movie extends Watchlist {
  const Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required super.id,
    required this.originalTitle,
    required super.overview,
    required this.popularity,
    required super.posterPath,
    required this.releaseDate,
    required super.name,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }) : super(type: WatchlistType.movie);

  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final String? originalTitle;
  final double? popularity;
  final String? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  @override
  List<Object?> get props => [
        ...super.props,
        adult,
        backdropPath,
        genreIds,
        id,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        video,
        voteAverage,
        voteCount,
      ];
}
