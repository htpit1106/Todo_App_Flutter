import 'package:json_annotation/json_annotation.dart';

part 'profile_entity.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileEntity {
  final String? id;
  final String? name;
  final String? email;
  final String? birth;
  final String? avatarLink;

  ProfileEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? birth,
    String? avatarLink,
  }) {
    return ProfileEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      birth: birth ?? this.birth,
      avatarLink: avatarLink ?? this.avatarLink,
    );
  }

  ProfileEntity({
    this.id,
    this.name,
    this.email,
    this.birth,
    this.avatarLink,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) => _$ProfileEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileEntityToJson(this);
}