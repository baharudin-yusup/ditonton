import 'package:core/data/models/watchlist_table.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';

class TvShowTable extends WatchlistTable {
  const TvShowTable({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.overview,
  }) : super(type: 'tv_show');

  factory TvShowTable.fromEntity(TvShowDetail tvShow) => TvShowTable(
        id: tvShow.id,
        title: tvShow.name,
        posterPath: tvShow.posterPath,
        overview: tvShow.overview,
      );

  factory TvShowTable.fromMap(Map<String, dynamic> map) => TvShowTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  TvShow toEntity() => TvShow(
        id: id,
        overview: overview,
        posterPath: posterPath,
        name: title,
      );
}
