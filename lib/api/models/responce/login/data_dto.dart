import 'package:akoun/api/models/responce/login/active_child_dto.dart';
import 'package:akoun/api/models/responce/login/parent_dto.dart';
import 'package:akoun/api/models/responce/login/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_dto.g.dart';

@JsonSerializable()
class DataDto {
  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @JsonKey(name: 'expires_in')
  final int? expiresIn;
  @JsonKey(name: 'user_type')
  final String? userType;
  @JsonKey(name: 'user')
  final UserDto? user;
  @JsonKey(name: 'parent')
  final ParentDto? parent;
  @JsonKey(name: 'active_child')
  final ActiveChildDto? activeChild;

  DataDto({
    this.token,
    this.tokenType,
    this.expiresIn,
    this.userType,
    this.user,
    this.parent,
    this.activeChild,
  });

  factory DataDto.fromJson(Map<String, dynamic> json) =>
      _$DataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DataDtoToJson(this);
}
