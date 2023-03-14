import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieModel extends Equatable {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String? releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieModel(
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

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

extension MovieModelToEntity on MovieModel {
  Movie toEntity() {
    return Movie(
      adult: adult,
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath!,
      releaseDate: releaseDate,
      name: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
