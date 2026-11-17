import 'package:akoun/core/exceptions/app_exception.dart';
import 'package:akoun/domain/entities/request/login/login_request.dart';
import 'package:akoun/domain/use_cases/auth/login_use_case.dart';
import 'package:akoun/feature/ui/auth/login/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  final LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());

  Future<void> login({
    required String email,
    String? password,
  }) async {
    emit(LoginLoadingState());
    try {
      final response = await loginUseCase.invoke(
        LoginRequest(
          type: 'parent',
          email: email,
          password: password ?? 'SecretPassword123',
          rememberMe: true,
        ),
      );
      emit(LoginSuccessState(loginResponce: response));
    } catch (e) {
      emit(LoginErrorState(errorMessage: AppException.fromError(e).message));
    }
  }
}
