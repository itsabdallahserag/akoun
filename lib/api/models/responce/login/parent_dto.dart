import 'package:json_annotation/json_annotation.dart';

part 'parent_dto.g.dart';

@JsonSerializable()
class ParentDto {
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

  ParentDto({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.avatarUrl,
    this.language,
  });

  factory ParentDto.fromJson(Map<String, dynamic> json) =>
      _$ParentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ParentDtoToJson(this);
}
