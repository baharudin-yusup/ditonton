import 'package:core/data/models/watchlist_table.dart';

import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';

class MovieTable extends WatchlistTable {
  const MovieTable({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.overview,
  }) : super(type: 'movie');

  factory MovieTable.fromEntity(MovieDetail movie) => MovieTable(
        id: movie.id,
        title: movie.name,
        posterPath: movie.posterPath,
        overview: movie.overview,
      );

  factory MovieTable.fromMap(Map<String, dynamic> map) => MovieTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  Movie toEntity() => Movie(
        id: id,
        overview: overview,
        posterPath: posterPath,
        name: title,
        adult: null,
        backdropPath: null,
        genreIds: null,
        originalTitle: null,
        popularity: null,
        releaseDate: null,
        video: null,
        voteAverage: null,
        voteCount: null,
      );
}
