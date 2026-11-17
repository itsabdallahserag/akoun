// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_child_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveChildDto _$ActiveChildDtoFromJson(Map<String, dynamic> json) =>
    ActiveChildDto(
      id: (json['id'] as num?)?.toInt(),
      childName: json['child_name'] as String?,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      mentorGender: json['mentor_gender'] as String?,
      dialect: json['dialect'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$ActiveChildDtoToJson(ActiveChildDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'child_name': instance.childName,
      'age': instance.age,
      'gender': instance.gender,
      'mentor_gender': instance.mentorGender,
      'dialect': instance.dialect,
      'avatar_url': instance.avatarUrl,
    };
