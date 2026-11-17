import 'package:akoun/domain/entities/responce/register/register_parent.dart';

class RegisterData {
  final String? token;

  final String? tokenType;

  final int? expiresIn;

  final String? id;

  final String? fullName;

  final String? email;

  final RegisterParent? parent;

  RegisterData({
    this.token,
    this.tokenType,
    this.expiresIn,
    this.id,
    this.fullName,
    this.email,
    this.parent,
  });
}
