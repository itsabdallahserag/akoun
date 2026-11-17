import 'package:akoun/domain/entities/responce/login/login_responce.dart';

sealed class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginResponce loginResponce;
  LoginSuccessState({required this.loginResponce});
}

class LoginErrorState extends LoginStates {
  final String errorMessage;
  LoginErrorState({required this.errorMessage});
}
