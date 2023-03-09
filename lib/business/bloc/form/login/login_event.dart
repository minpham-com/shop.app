abstract class LoginEvent {}

class LoginOut extends LoginEvent {}

class LoginSubmit extends LoginEvent {}

class LoginChangeFormEvent extends LoginEvent {
  String? email;
  String? password;
  LoginChangeFormEvent({String? email, String? password}) {
    email = email;
    password = password;
  }
}
