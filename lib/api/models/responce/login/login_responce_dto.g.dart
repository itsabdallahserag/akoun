// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_responce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponceDto _$LoginResponceDtoFromJson(Map<String, dynamic> json) =>
    LoginResponceDto(
      status: json['status'] as bool?,
      success: json['success'] as bool?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponceDtoToJson(LoginResponceDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
