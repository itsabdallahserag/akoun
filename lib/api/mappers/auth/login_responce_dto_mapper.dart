import 'package:akoun/api/models/responce/login/login_responce_dto.dart';
import 'package:akoun/domain/entities/responce/login/login_responce.dart';

extension LoginResponceDtoMapper on LoginResponceDto {
  LoginResponce toLoginResponce() {
    return LoginResponce(
      code: code,
      data: data,
      message: message,
      status: status,
      success: success,
    );
  }
}
