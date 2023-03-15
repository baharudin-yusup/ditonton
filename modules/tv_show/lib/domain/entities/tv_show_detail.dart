import 'package:core/core.dart';

import 'season.dart';

class TvShowDetail extends Watchlist {
  const TvShowDetail({
    required super.id,
    required super.overview,
    required super.posterPath,
    required super.name,
    this.backdropPath,
    this.episodeRunTime,
    this.firstAirDate,
    required this.genres,
    this.homepage,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.popularity,
    this.status,
    this.tagline,
    required this.voteAverage,
    required this.voteCount,
    required this.latestSeason,
  }) : super(type: WatchlistType.tvShow);

  final String? backdropPath;
  final List<int>? episodeRunTime;
  final DateTime? firstAirDate;
  final List<Genre> genres;
  final String? homepage;
  final bool? inProduction;
  final List<String>? languages;
  final DateTime? lastAirDate;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final double? popularity;
  final String? status;
  final String? tagline;
  final double voteAverage;
  final int voteCount;
  final Season? latestSeason;

  @override
  List<Object?> get props => [
        backdropPath,
        episodeRunTime,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        languages,
        lastAirDate,
        name,
        numberOfEpisodes,
        numberOfSeasons,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
        latestSeason,
      ];
}
