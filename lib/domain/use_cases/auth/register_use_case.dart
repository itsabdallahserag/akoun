import 'package:akoun/domain/entities/request/register/register_request.dart';
import 'package:akoun/domain/entities/responce/register/register_response.dart';
import 'package:akoun/domain/repositories/auth/register_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  RegisterRepository registerRepository;

  RegisterUseCase({required this.registerRepository});

  Future<RegisterResponse> invoke(RegisterRequest registerRequest) {
    return registerRepository.register(registerRequest);
  }
}
