import 'package:json_annotation/json_annotation.dart';

import '../enum/category.dart';

part 'todo_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TodoEntity {
  final String? id;
  final String? title;
  final String? userId;
  final Category? category;
  final String? time;
  final String? createdAt;
  final String? notes;
  bool isCompleted;

  TodoEntity copyWith({
    String? id,
    String? title,
    String? userId,
    Category? category,
    String? time,
    String? createdAt,
    String? notes,
    bool? isCompleted,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      category: category ?? this.category,
      time: time ?? this.time,
      createdAt: createdAt ?? this.createdAt,
      notes: notes ?? this.notes,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  TodoEntity({
    this.id,
    this.title,
    this.category,
    this.time,
    this.createdAt,
    this.notes,

    required this.isCompleted,
    this.userId,
  });

  factory TodoEntity.fromJson(Map<String, dynamic> json) => _$TodoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TodoEntityToJson(this);

  Map<String, dynamic> toJsonInsert() => _$TodoEntityToJsonInsert(this);
}
