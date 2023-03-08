abstract class LoginEvent {}

class LoginLoadingStart extends LoginEvent {}

class LoginLoadingEnd extends LoginEvent {}

class LoginSuccess extends LoginEvent {}

class LoginFailed extends LoginEvent {}

class LoginSet extends LoginEvent {}

class LoginOut extends LoginEvent {}

class LoginSubmit extends LoginEvent {}

class LoginChangeEmailEvent extends LoginEvent {}

class LoginChangePasswordEvent extends LoginEvent {}
