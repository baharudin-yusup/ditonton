import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:equatable/equatable.dart';

class TvShow extends Equatable {
  TvShow({
    required this.posterPath,
    this.popularity,
    required this.id,
    this.backdropPath,
    this.voteAverage,
    required this.overview,
    this.firstAirDate,
    this.originCountry,
    this.genreIds,
    this.originalLanguage,
    this.voteCount,
    required this.name,
    this.originalName,
  });

  final String posterPath;
  final double? popularity;
  final int id;
  final String? backdropPath;
  final double? voteAverage;
  final String overview;
  final DateTime? firstAirDate;
  final List<String>? originCountry;
  final List<int>? genreIds;
  final String? originalLanguage;
  final int? voteCount;
  final String name;
  final String? originalName;

  Watchlist toWatchlist() {
    return Watchlist(
      id: id,
      overview: overview,
      posterPath: posterPath,
      name: name,
      type: WatchlistType.tvShow,
    );
  }

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
