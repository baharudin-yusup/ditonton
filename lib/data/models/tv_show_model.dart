import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:equatable/equatable.dart';

class TvShowModel extends Equatable {
  TvShowModel({
    required this.posterPath,
    required this.popularity,
    required this.id,
    required this.backdropPath,
    required this.voteAverage,
    required this.overview,
    required this.originCountry,
    required this.genreIds,
    required this.originalLanguage,
    required this.voteCount,
    required this.name,
    required this.originalName,
    required this.firstAirDate,
  });

  final String? posterPath;
  final double popularity;
  final int id;
  final String? backdropPath;
  final double voteAverage;
  final String overview;
  final List<String>? originCountry;
  final List<int> genreIds;
  final String originalLanguage;
  final int voteCount;
  final String name;
  final String originalName;
  final DateTime? firstAirDate;

  TvShowModel copyWith({
    String? posterPath,
    double? popularity,
    int? id,
    String? backdropPath,
    double? voteAverage,
    String? overview,
    DateTime? firstAirDate,
    List<String>? originCountry,
    List<int>? genreIds,
    String? originalLanguage,
    int? voteCount,
    String? name,
    String? originalName,
  }) =>
      TvShowModel(
        posterPath: posterPath ?? this.posterPath,
        popularity: popularity ?? this.popularity,
        id: id ?? this.id,
        backdropPath: backdropPath ?? this.backdropPath,
        voteAverage: voteAverage ?? this.voteAverage,
        overview: overview ?? this.overview,
        originCountry: originCountry ?? this.originCountry,
        genreIds: genreIds ?? this.genreIds,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        voteCount: voteCount ?? this.voteCount,
        name: name ?? this.name,
        originalName: originalName ?? this.originalName,
        firstAirDate: firstAirDate ?? this.firstAirDate,
      );

  factory TvShowModel.fromJson(Map<String, dynamic> json) => TvShowModel(
        posterPath: json["poster_path"],
        popularity: json["popularity"]?.toDouble(),
        id: json["id"],
        backdropPath: json["backdrop_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        overview: json["overview"],
        originCountry: json["origin_country"] != null
            ? List<String>.from(json["origin_country"].map((x) => x))
            : null,
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        originalLanguage: json["original_language"],
        voteCount: json["vote_count"],
        name: json["name"],
        originalName: json["original_name"],
        firstAirDate: json["first_air_date"] != null
            ? DateTime.tryParse(json["first_air_date"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "poster_path": posterPath,
        "popularity": popularity,
        "id": id,
        "backdrop_path": backdropPath,
        "vote_average": voteAverage,
        "overview": overview,
        if (originCountry != null)
          "origin_country": List<dynamic>.from(originCountry!.map((x) => x)),
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "original_language": originalLanguage,
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName,
        if (firstAirDate != null)
          "first_air_date":
              "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
      };

  @override
  List<Object?> get props => [
        posterPath,
        popularity,
        id,
        backdropPath,
        voteAverage,
        overview,
        originCountry,
        genreIds,
        originalLanguage,
        voteCount,
        name,
        originalName,
      ];
}

extension ModelToEntity on TvShowModel {
  TvShow toEntity() {
    return TvShow(
      posterPath: posterPath!,
      popularity: popularity,
      id: id,
      backdropPath: backdropPath,
      voteAverage: voteAverage,
      overview: overview,
      originCountry: originCountry,
      genreIds: genreIds,
      originalLanguage: originalLanguage,
      voteCount: voteCount,
      name: name,
      originalName: originalName,
    );
  }
}
