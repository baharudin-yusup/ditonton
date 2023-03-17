import 'package:equatable/equatable.dart';

import 'tv_show_model.dart';

class TvShowResponse extends Equatable {
  TvShowResponse({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });

  final int page;
  final List<TvShowModel> results;
  final int totalResults;
  final int totalPages;

  TvShowResponse copyWith({
    int? page,
    List<TvShowModel>? results,
    int? totalResults,
    int? totalPages,
  }) =>
      TvShowResponse(
        page: page ?? this.page,
        results: results ?? this.results,
        totalResults: totalResults ?? this.totalResults,
        totalPages: totalPages ?? this.totalPages,
      );

  factory TvShowResponse.fromJson(Map<String, dynamic> json) => TvShowResponse(
        page: json["page"],
        results: List<TvShowModel>.from(json["results"]
            .map((x) => TvShowModel.fromJson(x))
            .where((element) => element.posterPath != null)),
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_results": totalResults,
        "total_pages": totalPages,
      };

  @override
  List<Object?> get props => [
        page,
        results,
        totalResults,
        totalPages,
      ];
}
