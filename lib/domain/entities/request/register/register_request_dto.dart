class RegisterRequest {
  final String? type;

  final String? fullName;

  final String? email;

  final String? phone;

  final String? password;

  final String? passwordConfirmation;

  RegisterRequest({
    this.type,
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.passwordConfirmation,
  });
}
