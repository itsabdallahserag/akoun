import 'package:json_annotation/json_annotation.dart';

part 'register_parent_dto.g.dart';

@JsonSerializable()
class RegisterParentDto {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'full_name')
  final String? fullName;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  @JsonKey(name: 'language')
  final String? language;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  RegisterParentDto({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.avatarUrl,
    this.language,
    this.createdAt,
  });

  factory RegisterParentDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterParentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterParentDtoToJson(this);
}
