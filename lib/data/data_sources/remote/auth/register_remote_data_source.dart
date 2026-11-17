import 'package:akoun/domain/entities/request/register/register_request.dart';
import 'package:akoun/domain/entities/responce/register/register_response.dart';

abstract class RegisterRemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest registerRequest);
}
