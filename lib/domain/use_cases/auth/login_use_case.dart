import 'package:akoun/domain/entities/request/login/login_request.dart';
import 'package:akoun/domain/entities/responce/login/login_responce.dart';
import 'package:akoun/domain/repositories/auth/login_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  LoginRepository loginRepository;
  LoginUseCase({required this.loginRepository});
  Future<LoginResponce> invoke(LoginRequest loginRequest) {
    return loginRepository.login(loginRequest);
  }
}
