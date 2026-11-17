import 'package:akoun/api/models/request/login/login_request_dto.dart';
import 'package:akoun/domain/entities/request/login/login_request.dart';

extension LoginRequestMapper on LoginRequest {
  LoginRequestDto toLoginRequestDto() {
    return LoginRequestDto(
      email: email,
      password: password,
      rememberMe: rememberMe,
      type: type,
    );
  }
}
