import 'package:akoun/api/models/responce/register/register_data_dto.dart';
import 'package:akoun/api/models/responce/register/register_parent_dto.dart';
import 'package:akoun/api/models/responce/register/register_response_dto.dart';
import 'package:akoun/domain/entities/responce/register/register_data.dart';
import 'package:akoun/domain/entities/responce/register/register_parent.dart';
import 'package:akoun/domain/entities/responce/register/register_response.dart';

extension RegisterResponseDtoMapper on RegisterResponseDto {
  RegisterResponse toRegisterResponse() {
    return RegisterResponse(
      status: status,
      success: success,
      code: code,
      message: message,
      data: data?.toRegisterData(),
    );
  }
}

extension RegisterDataDtoMapper on RegisterDataDto {
  RegisterData toRegisterData() {
    return RegisterData(
      token: token,
      tokenType: tokenType,
      expiresIn: expiresIn,
      id: id,
      fullName: fullName,
      email: email,
      parent: parent?.toRegisterParent(),
    );
  }
}

extension RegisterParentDtoMapper on RegisterParentDto {
  RegisterParent toRegisterParent() {
    return RegisterParent(
      id: id,
      fullName: fullName,
      email: email,
      phone: phone,
      avatarUrl: avatarUrl,
      language: language,
      createdAt: createdAt,
    );
  }
}
