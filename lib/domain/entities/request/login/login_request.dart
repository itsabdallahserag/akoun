class LoginRequest {
  final String? type;
  final String? email;
  final String? password;
  final bool? rememberMe;

  LoginRequest({this.type, this.email, this.password, this.rememberMe});
}
