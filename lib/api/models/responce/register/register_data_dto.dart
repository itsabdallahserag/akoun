import 'package:akoun/api/models/responce/register/register_parent_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_data_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterDataDto {
  @JsonKey(name: 'token')
  final String? token;

  @JsonKey(name: 'token_type')
  final String? tokenType;

  @JsonKey(name: 'expires_in')
  final int? expiresIn;

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'full_name')
  final String? fullName;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'parent')
  final RegisterParentDto? parent;

  RegisterDataDto({
    this.token,
    this.tokenType,
    this.expiresIn,
    this.id,
    this.fullName,
    this.email,
    this.parent,
  });

  factory RegisterDataDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDataDtoToJson(this);
}
