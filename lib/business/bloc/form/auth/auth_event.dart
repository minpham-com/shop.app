import 'package:store/business/bloc/form/form_event.dart';

abstract class AuthEvent extends FormEvent {}

abstract class LoginEvent extends AuthEvent {}

class RegisterSubmit extends AuthEvent {}

class ForgotPasswordSubmit extends AuthEvent {}

class ForgotPasswordRequestSubmit extends AuthEvent {}

class LoginOut extends LoginEvent {}

class LoginSubmit extends LoginEvent {}

class AuthChangeFormEvent extends LoginEvent {}

class UserNameChanged extends AuthChangeFormEvent {
  UserNameChanged(this.userName);

  final String userName;

  @override
  List<Object> get props => [userName];
}

class PasswordChanged extends AuthChangeFormEvent {
  PasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends AuthChangeFormEvent {
  ConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}
