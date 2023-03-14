import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/genre.dart';

part 'genre_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GenreModel {
  final int id;
  final String name;

  GenreModel(this.id, this.name);

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}

extension ModelToEntity on GenreModel {
  Genre toEntity() {
    return Genre(id: id, name: name);
  }
}
