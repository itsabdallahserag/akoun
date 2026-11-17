import 'package:json_annotation/json_annotation.dart';

part 'register_request_dto.g.dart';

@JsonSerializable()
class RegisterRequestDto {
  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'full_name')
  final String? fullName;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'password_confirmation')
  final String? passwordConfirmation;

  RegisterRequestDto({
    this.type,
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.passwordConfirmation,
  });

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);
}
