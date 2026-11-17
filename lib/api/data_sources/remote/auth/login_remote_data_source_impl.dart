import 'package:akoun/api/api_services.dart';
import 'package:akoun/api/mappers/auth/login_request_mapper.dart';
import 'package:akoun/api/mappers/auth/login_responce_dto_mapper.dart';
import 'package:akoun/core/exceptions/app_exception.dart';
import 'package:akoun/data/data_sources/remote/auth/login_remote_data_source.dart';
import 'package:akoun/domain/entities/request/login/login_request.dart';
import 'package:akoun/domain/entities/responce/login/login_responce.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  ApiServices apiServices;

  LoginRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<LoginResponce> login(LoginRequest loginRequest) async {
    try {
      var loginResponce = await apiServices.login(
        loginRequest.toLoginRequestDto(),
      );
      return loginResponce.toLoginResponce();
    } on DioException catch (e) {
      throw AppException.fromDioException(e);
    } catch (e) {
      throw AppException.fromError(e);
    }
  }
}
