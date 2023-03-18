// coverage:ignore-start
import 'package:equatable/equatable.dart';

enum WatchlistType {
  movie,
  tvShow,
}

class Watchlist extends Equatable {
  final int id;
  final String overview;
  final String posterPath;
  final String name;
  final WatchlistType type;

  const Watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.name,
    required this.type,
  });

  @override
  List<Object?> get props => [
        id,
        overview,
        posterPath,
        name,
        type,
      ];
}
// coverage:ignore-end
