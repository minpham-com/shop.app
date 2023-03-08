class UserState {
  late bool _success;

  late bool _loading;

  late bool _isLoggedIn;

  UserState() {
    _success = true;
    _loading = false;
    _isLoggedIn = false;
  }

  factory UserState.initial() {
    return UserState();
  }

  bool get success => _success;

  bool get loading => _loading;

  bool get isLoggedIn => _isLoggedIn;
}
