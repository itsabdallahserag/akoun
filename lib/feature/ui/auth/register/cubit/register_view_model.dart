import 'package:akoun/core/exceptions/app_exception.dart';
import 'package:akoun/domain/entities/request/register/register_request.dart';
import 'package:akoun/domain/use_cases/auth/register_use_case.dart';
import 'package:akoun/feature/ui/auth/register/cubit/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  final RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  Future<void> register({
    required String fullName,
    required String email,
    required String phone,
    String? password,
    String? passwordConfirmation,
  }) async {
    emit(RegisterLoadingState());
    try {
      final defaultPass = password ?? 'SecretPassword123';
      final response = await registerUseCase.invoke(
        RegisterRequest(
          type: 'parent',
          fullName: fullName,
          email: email,
          phone: phone,
          password: defaultPass,
          passwordConfirmation: passwordConfirmation ?? defaultPass,
        ),
      );
      emit(RegisterSuccessState(registerResponse: response));
    } catch (e) {
      emit(RegisterErrorState(errorMessage: AppException.fromError(e).message));
    }
  }
}
