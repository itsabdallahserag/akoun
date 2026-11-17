import 'package:akoun/domain/entities/responce/register/register_data.dart';

class RegisterResponse {
  final bool? status;

  final bool? success;

  final int? code;

  final String? message;

  final RegisterData? data;

  RegisterResponse({
    this.status,
    this.success,
    this.code,
    this.message,
    this.data,
  });
}

typedef RegisterResponceDto = RegisterResponse;
