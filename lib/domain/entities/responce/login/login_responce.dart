import 'package:akoun/api/models/responce/login/data_dto.dart';

class LoginResponce {
  final bool? status;
  final bool? success;
  final int? code;
  final String? message;
  final DataDto? data;

  LoginResponce({
    this.status,
    this.success,
    this.code,
    this.message,
    this.data,
  });
}
