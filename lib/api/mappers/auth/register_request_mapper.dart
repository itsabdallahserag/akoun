import 'package:akoun/api/models/request/register/register_request_dto.dart';
import 'package:akoun/domain/entities/request/register/register_request.dart';

extension RegisterRequestMapper on RegisterRequest {
  RegisterRequestDto toRegisterRequestDto() {
    return RegisterRequestDto(
      type: type,
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
