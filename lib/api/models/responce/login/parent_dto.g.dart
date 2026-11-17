// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParentDto _$ParentDtoFromJson(Map<String, dynamic> json) => ParentDto(
  id: json['id'] as String?,
  fullName: json['full_name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  language: json['language'] as String?,
);

Map<String, dynamic> _$ParentDtoToJson(ParentDto instance) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'email': instance.email,
  'phone': instance.phone,
  'avatar_url': instance.avatarUrl,
  'language': instance.language,
};
