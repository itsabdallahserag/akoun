import 'package:akoun/domain/entities/responce/login/active_child.dart';
import 'package:akoun/domain/entities/responce/login/parent.dart';
import 'package:akoun/domain/entities/responce/login/user.dart';

class Data {
  final String? token;
  final String? tokenType;
  final int? expiresIn;
  final String? userType;
  final User? user;
  final Parent? parent;
  final ActiveChild? activeChild;

  Data({
    this.token,
    this.tokenType,
    this.expiresIn,
    this.userType,
    this.user,
    this.parent,
    this.activeChild,
  });
}
