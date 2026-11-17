import 'package:akoun/data/data_sources/remote/auth/login_remote_data_source.dart';
import 'package:akoun/domain/entities/request/login/login_request.dart';
import 'package:akoun/domain/entities/responce/login/login_responce.dart';
import 'package:akoun/domain/repositories/auth/login_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImp implements LoginRepository {
  LoginRemoteDataSource loginRemoteDataSource;
  LoginRepositoryImp({required this.loginRemoteDataSource});
  @override
  Future<LoginResponce> login(LoginRequest loginRequest) {
    return loginRemoteDataSource.login(loginRequest);
  }
}
