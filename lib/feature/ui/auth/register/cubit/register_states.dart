import 'package:akoun/domain/entities/responce/register/register_response.dart';

sealed class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final RegisterResponse registerResponse;
  RegisterSuccessState({required this.registerResponse});
}

class RegisterErrorState extends RegisterStates {
  final String errorMessage;
  RegisterErrorState({required this.errorMessage});
}
