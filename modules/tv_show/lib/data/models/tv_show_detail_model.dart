import 'package:core/data/models/genre_model.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/tv_show_detail.dart';
import 'creator_model.dart';
import 'episode_model.dart';
import 'language_model.dart';
import 'season_model.dart';

class TvShowDetailModel extends Equatable {
  TvShowDetailModel({
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  final List<CreatorModel> createdBy;
  final List<int> episodeRunTime;
  final DateTime firstAirDate;
  final List<GenreModel> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final DateTime lastAirDate;
  final EpisodeModel lastEpisodeToAir;
  final String name;
  final EpisodeModel? nextEpisodeToAir;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<SeasonModel> seasons;
  final List<LanguageModel> spokenLanguages;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;

  TvShowDetailModel copyWith({
    String? backdropPath,
    List<CreatorModel>? createdBy,
    List<int>? episodeRunTime,
    DateTime? firstAirDate,
    List<GenreModel>? genres,
    String? homepage,
    int? id,
    bool? inProduction,
    List<String>? languages,
    DateTime? lastAirDate,
    EpisodeModel? lastEpisodeToAir,
    String? name,
    EpisodeModel? nextEpisodeToAir,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    List<SeasonModel>? seasons,
    List<LanguageModel>? spokenLanguages,
    String? status,
    String? tagline,
    String? type,
    double? voteAverage,
    int? voteCount,
  }) =>
      TvShowDetailModel(
        backdropPath: backdropPath ?? this.backdropPath,
        createdBy: createdBy ?? this.createdBy,
        episodeRunTime: episodeRunTime ?? this.episodeRunTime,
        firstAirDate: firstAirDate ?? this.firstAirDate,
        genres: genres ?? this.genres,
        homepage: homepage ?? this.homepage,
        id: id ?? this.id,
        inProduction: inProduction ?? this.inProduction,
        languages: languages ?? this.languages,
        lastAirDate: lastAirDate ?? this.lastAirDate,
        lastEpisodeToAir: lastEpisodeToAir ?? this.lastEpisodeToAir,
        name: name ?? this.name,
        nextEpisodeToAir: nextEpisodeToAir ?? this.nextEpisodeToAir,
        numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
        numberOfSeasons: numberOfSeasons ?? this.numberOfSeasons,
        originCountry: originCountry ?? this.originCountry,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalName: originalName ?? this.originalName,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        seasons: seasons ?? this.seasons,
        spokenLanguages: spokenLanguages ?? this.spokenLanguages,
        status: status ?? this.status,
        tagline: tagline ?? this.tagline,
        type: type ?? this.type,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory TvShowDetailModel.fromJson(Map<String, dynamic> json) =>
      TvShowDetailModel(
        backdropPath: json["backdrop_path"],
        createdBy: List<CreatorModel>.from(
            json["created_by"].map((x) => CreatorModel.fromJson(x))),
        episodeRunTime: List<int>.from(json["episode_run_time"].map((x) => x)),
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genres: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        lastAirDate: DateTime.parse(json["last_air_date"]),
        lastEpisodeToAir: EpisodeModel.fromJson(json["last_episode_to_air"]),
        name: json["name"],
        nextEpisodeToAir: json["next_episode_to_air"] != null
            ? EpisodeModel.fromJson(json["next_episode_to_air"])
            : null,
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        seasons: List<SeasonModel>.from(
            json["seasons"].map((x) => SeasonModel.fromJson(x))),
        spokenLanguages: List<LanguageModel>.from(
            json["spoken_languages"].map((x) => LanguageModel.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "created_by": List<dynamic>.from(createdBy.map((x) => x.toJson())),
        "episode_run_time": List<dynamic>.from(episodeRunTime.map((x) => x)),
        "first_air_date":
            "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "in_production": inProduction,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "last_air_date":
            "${lastAirDate.year.toString().padLeft(4, '0')}-${lastAirDate.month.toString().padLeft(2, '0')}-${lastAirDate.day.toString().padLeft(2, '0')}",
        "last_episode_to_air": lastEpisodeToAir.toJson(),
        "name": name,
        "next_episode_to_air": nextEpisodeToAir,
        "number_of_episodes": numberOfEpisodes,
        "number_of_seasons": numberOfSeasons,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
        "spoken_languages":
            List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "type": type,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  @override
  List<Object?> get props => [
        backdropPath,
        createdBy,
        episodeRunTime,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        languages,
        lastAirDate,
        lastEpisodeToAir,
        name,
        nextEpisodeToAir,
        numberOfEpisodes,
        numberOfSeasons,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        seasons,
        spokenLanguages,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}

extension TvShowDetailModelToEntity on TvShowDetailModel {
  TvShowDetail toEntity() {
    return TvShowDetail(
      backdropPath: backdropPath,
      episodeRunTime: episodeRunTime,
      firstAirDate: firstAirDate,
      genres: genres.map((genre) => genre.toEntity()).toList(),
      homepage: homepage,
      id: id,
      inProduction: inProduction,
      languages: languages,
      lastAirDate: lastAirDate,
      name: name,
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      status: status,
      tagline: tagline,
      voteAverage: voteAverage,
      voteCount: voteCount,
      latestSeason: seasons.isNotEmpty ? seasons.last.toEntity() : null,
    );
  }
}
