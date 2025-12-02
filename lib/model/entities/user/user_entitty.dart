import 'package:json_annotation/json_annotation.dart';

// part 'user_entity.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class UserEntity {
  final String? id;
  final String ? fullName;
  final String? email;
  final String? password;

  UserEntity({
    this.id,
    this.fullName,
    this.email,
    this.password,
  });
}