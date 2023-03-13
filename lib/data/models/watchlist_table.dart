import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WatchlistTable extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String type;

  const WatchlistTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
        'type': type,
      };

  @mustCallSuper
  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        overview,
        type,
      ];
}
