import 'package:akoun/domain/entities/request/login/login_request.dart';
import 'package:akoun/domain/entities/responce/login/login_responce.dart';

abstract class LoginRepository {
  Future<LoginResponce> login(LoginRequest loginRequest);
}
