// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDataDto _$RegisterDataDtoFromJson(Map<String, dynamic> json) =>
    RegisterDataDto(
      token: json['token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      id: json['id'] as String?,
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      parent: json['parent'] == null
          ? null
          : RegisterParentDto.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterDataDtoToJson(RegisterDataDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'parent': instance.parent?.toJson(),
    };
