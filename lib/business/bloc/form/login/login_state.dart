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
  LoginState() {
    _userEmail = null;
    _password = null;
    _confirmPassword = null;
    _success = false;
    _loading = false;
  }

  String? get userEmail => _userEmail;

  String? get password => _password;

  String? get confirmPassword => _confirmPassword;

  bool get success => _success;

  bool get loading => _loading;
}
