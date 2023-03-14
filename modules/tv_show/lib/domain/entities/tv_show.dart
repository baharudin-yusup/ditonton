import 'package:core/core.dart';

class TvShow extends Watchlist {
  TvShow({
    required super.id,
    required super.overview,
    required super.posterPath,
    required super.name,
    this.popularity,
    this.backdropPath,
    this.voteAverage,
    this.firstAirDate,
    this.originCountry,
    this.genreIds,
    this.originalLanguage,
    this.voteCount,
    this.originalName,
  }) : super(type: WatchlistType.tvShow);

  final double? popularity;
  final String? backdropPath;
  final double? voteAverage;
  final DateTime? firstAirDate;
  final List<String>? originCountry;
  final List<int>? genreIds;
  final String? originalLanguage;
  final int? voteCount;
  final String? originalName;

  @override
  List<Object?> get props => [
        posterPath,
        popularity,
        id,
        backdropPath,
        voteAverage,
        overview,
        firstAirDate,
        originCountry,
        genreIds,
        originalLanguage,
        voteCount,
        name,
        originalName,
      ];
}
