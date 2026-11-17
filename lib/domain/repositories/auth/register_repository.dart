import 'package:akoun/domain/entities/request/register/register_request.dart';
import 'package:akoun/domain/entities/responce/register/register_response.dart';

abstract class RegisterRepository {
  Future<RegisterResponse> register(RegisterRequest registerRequest);
}
