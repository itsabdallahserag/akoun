// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestDto _$LoginRequestDtoFromJson(Map<String, dynamic> json) =>
    LoginRequestDto(
      type: json['type'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      rememberMe: json['remember_me'] as bool?,
    );

Map<String, dynamic> _$LoginRequestDtoToJson(LoginRequestDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'email': instance.email,
      'password': instance.password,
      'remember_me': instance.rememberMe,
    };
