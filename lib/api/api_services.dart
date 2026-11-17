import 'package:akoun/api/api_constants.dart';
import 'package:akoun/api/models/request/login/login_request_dto.dart';
import 'package:akoun/api/models/request/register/register_request_dto.dart';
import 'package:akoun/api/models/responce/login/login_responce_dto.dart';
import 'package:akoun/api/models/responce/register/register_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponceDto> login(@Body() LoginRequestDto loginRequestDto);

  @POST(ApiConstants.register)
  Future<RegisterResponseDto> register(@Body() RegisterRequestDto registerRequestDto);
}
