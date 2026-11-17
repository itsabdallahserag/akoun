// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataDto _$DataDtoFromJson(Map<String, dynamic> json) => DataDto(
  token: json['token'] as String?,
  tokenType: json['token_type'] as String?,
  expiresIn: (json['expires_in'] as num?)?.toInt(),
  userType: json['user_type'] as String?,
  user: json['user'] == null
      ? null
      : UserDto.fromJson(json['user'] as Map<String, dynamic>),
  parent: json['parent'] == null
      ? null
      : ParentDto.fromJson(json['parent'] as Map<String, dynamic>),
  activeChild: json['active_child'] == null
      ? null
      : ActiveChildDto.fromJson(json['active_child'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataDtoToJson(DataDto instance) => <String, dynamic>{
  'token': instance.token,
  'token_type': instance.tokenType,
  'expires_in': instance.expiresIn,
  'user_type': instance.userType,
  'user': instance.user,
  'parent': instance.parent,
  'active_child': instance.activeChild,
};
