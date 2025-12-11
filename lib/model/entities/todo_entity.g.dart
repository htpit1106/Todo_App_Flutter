// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoEntity _$TodoEntityFromJson(Map<String, dynamic> json) => TodoEntity(
  id: json['id'] as String?,
  title: json['title'] as String?,
  category: $enumDecodeNullable(_$CategoryEnumMap, json['category']),
  time: json['time'] as String?,
  createdAt: json['created_at'] as String?,
  notes: json['notes'] as String?,
  isCompleted: json['is_completed'] as bool,
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$TodoEntityToJson(TodoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'user_id': instance.userId,
      'category': _$CategoryEnumMap[instance.category],
      'time': instance.time,
      'created_at': instance.createdAt,
      'notes': instance.notes,
      'is_completed': instance.isCompleted,
    };
Map<String, dynamic> _$TodoEntityToJsonInsert(TodoEntity instance) => <String, dynamic>{
  'title': instance.title,
  'user_id': instance.userId,
  'category': _$CategoryEnumMap[instance.category],
  'time': instance.time,
  'created_at': instance.createdAt,
  'notes': instance.notes,
  'is_completed': instance.isCompleted,
};

const _$CategoryEnumMap = {
  Category.task: 'task',
  Category.event: 'event',
  Category.goal: 'goal',
};
