import 'package:akoun/data/data_sources/remote/auth/register_remote_data_source.dart';
import 'package:akoun/domain/entities/request/register/register_request.dart';
import 'package:akoun/domain/entities/responce/register/register_response.dart';
import 'package:akoun/domain/repositories/auth/register_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRepository)
class RegisterRepositoryImp implements RegisterRepository {
  RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepositoryImp({required this.registerRemoteDataSource});

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) {
    return registerRemoteDataSource.register(registerRequest);
  }
}
