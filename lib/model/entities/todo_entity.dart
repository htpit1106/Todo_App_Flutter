import 'package:json_annotation/json_annotation.dart';

import '../enum/category.dart';

part 'todo_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TodoEntity {
  final String id;
  final String? title;
  final String? userId;
  final Category? category;
  final String? time;
  final String? createdAt;
  final String? notes;
  bool isCompleted;

  TodoEntity({
    required this.id,
    this.title,
    this.category,
    this.time,
    this.createdAt,
    this.notes,

    required this.isCompleted,
    this.userId,
  });

  factory TodoEntity.fromJson(Map<String, dynamic> json) =>
      _$TodoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TodoEntityToJson(this);
}
