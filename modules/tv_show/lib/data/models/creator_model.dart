import 'package:equatable/equatable.dart';

class CreatorModel extends Equatable {
  CreatorModel({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    required this.profilePath,
  });

  final int id;
  final String? creditId;
  final String? name;
  final int? gender;
  final String? profilePath;

  CreatorModel copyWith({
    int? id,
    String? creditId,
    String? name,
    int? gender,
    String? profilePath,
  }) =>
      CreatorModel(
        id: id ?? this.id,
        creditId: creditId ?? this.creditId,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        profilePath: profilePath ?? this.profilePath,
      );

  factory CreatorModel.fromJson(Map<String, dynamic> json) => CreatorModel(
        id: json["id"],
        creditId: json["credit_id"],
        name: json["name"],
        gender: json["gender"],
        profilePath: json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "credit_id": creditId,
        "name": name,
        "gender": gender,
        "profile_path": profilePath,
      };

  @override
  List<Object?> get props => [id];
}
