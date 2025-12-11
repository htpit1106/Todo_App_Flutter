// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileEntity _$ProfileEntityFromJson(Map<String, dynamic> json) =>
    ProfileEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      birth: json['birth'] as String?,
      avatarLink: json['avatar_link'] as String?,
    );

Map<String, dynamic> _$ProfileEntityToJson(ProfileEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'birth': instance.birth,
      'avatar_link': instance.avatarLink,
    };
