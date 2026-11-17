import 'package:akoun/api/models/responce/register/register_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterResponseDto {
  @JsonKey(name: 'status')
  final bool? status;

  @JsonKey(name: 'success')
  final bool? success;

  @JsonKey(name: 'code')
  final int? code;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'data')
  final RegisterDataDto? data;

  RegisterResponseDto({
    this.status,
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseDtoToJson(this);
}

typedef RegisterResponceDto = RegisterResponseDto;
