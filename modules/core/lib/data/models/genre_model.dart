import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/genre.dart';

part 'genre_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GenreModel extends Equatable {
  final int id;
  final String name;

  const GenreModel(this.id, this.name);

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);

  @override
  List<Object?> get props => [id, name];
}

extension ModelToEntity on GenreModel {
  Genre toEntity() {
    return Genre(id: id, name: name);
  }
}
