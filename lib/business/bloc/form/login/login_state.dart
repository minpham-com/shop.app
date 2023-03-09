class LoginState {
  // ignore: unused_field
  String? _userEmail;

  String? _password;

  String? _confirmPassword;

  late bool _success;

  late bool _loading;

  bool get hasErrorsInLogin => _userEmail != null || _password != null;

  bool get hasErrorsInRegister =>
      _userEmail != null || _password != null || _confirmPassword != null;

  bool get hasErrorInForgotPassword => _userEmail != null;

  // ignore: avoid_positional_boolean_parameters
  LoginState(
      {String? email,
      String? password,
      String? confirmPassword,
      bool? success,
      bool? loading}) {
    _userEmail = email;
    _password = password;
    _confirmPassword = confirmPassword;
    _success = success!;
    _loading = loading!;
  }

  LoginState copyWith(
      {String? userEmail,
      String? password,
      String? confirmPassword,
      bool? success,
      bool? loading}) {
    return LoginState(
        email: userEmail ?? _userEmail,
        password: password ?? _password,
        confirmPassword: confirmPassword ?? _confirmPassword,
        success: success ?? _success,
        loading: loading ?? _loading);
  }

  String? get userEmail => _userEmail;

  String? get password => _password;

  String? get confirmPassword => _confirmPassword;

  bool get success => _success;

  bool get loading => _loading;
}
