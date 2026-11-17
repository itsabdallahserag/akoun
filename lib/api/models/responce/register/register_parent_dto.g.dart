// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_parent_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterParentDto _$RegisterParentDtoFromJson(Map<String, dynamic> json) =>
    RegisterParentDto(
      id: json['id'] as String?,
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      language: json['language'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$RegisterParentDtoToJson(RegisterParentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'avatar_url': instance.avatarUrl,
      'language': instance.language,
      'created_at': instance.createdAt,
    };
