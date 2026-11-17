import 'package:json_annotation/json_annotation.dart';

part 'active_child_dto.g.dart';

@JsonSerializable()
class ActiveChildDto {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'child_name')
  final String? childName;
  @JsonKey(name: 'age')
  final int? age;
  @JsonKey(name: 'gender')
  final String? gender;
  @JsonKey(name: 'mentor_gender')
  final String? mentorGender;
  @JsonKey(name: 'dialect')
  final String? dialect;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  ActiveChildDto({
    this.id,
    this.childName,
    this.age,
    this.gender,
    this.mentorGender,
    this.dialect,
    this.avatarUrl,
  });

  factory ActiveChildDto.fromJson(Map<String, dynamic> json) =>
      _$ActiveChildDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ActiveChildDtoToJson(this);
}
