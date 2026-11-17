import 'package:akoun/api/models/responce/login/data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_responce_dto.g.dart';

@JsonSerializable()
class LoginResponceDto {
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'success')
  final bool? success;
  @JsonKey(name: 'code')
  final int? code;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data')
  final DataDto? data;

  LoginResponceDto({
    this.status,
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory LoginResponceDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponceDtoToJson(this);
}
