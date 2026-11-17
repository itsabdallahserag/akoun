import 'package:akoun/api/api_services.dart';
import 'package:akoun/api/mappers/auth/register_request_mapper.dart';
import 'package:akoun/api/mappers/auth/register_response_dto_mapper.dart';
import 'package:akoun/core/exceptions/app_exception.dart';
import 'package:akoun/data/data_sources/remote/auth/register_remote_data_source.dart';
import 'package:akoun/domain/entities/request/register/register_request.dart';
import 'package:akoun/domain/entities/responce/register/register_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRemoteDataSource)
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  ApiServices apiServices;

  RegisterRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      var registerResponse = await apiServices.register(
        registerRequest.toRegisterRequestDto(),
      );
      return registerResponse.toRegisterResponse();
    } on DioException catch (e) {
      throw AppException.fromDioException(e);
    } catch (e) {
      throw AppException.fromError(e);
    }
  }
}
