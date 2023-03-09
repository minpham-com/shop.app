import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business/bloc/form/login/login_event.dart';
import 'package:store/business/bloc/form/login/login_state.dart';
import 'package:validators/validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginSubmit>(_submit);
    on<LoginOut>(_logout);
  }

  Future<void> _submit(LoginSubmit event, Emitter<LoginState> emit) async {
    emit(state);
  }

  Future<void> _logout(LoginOut event, Emitter<LoginState> emit) async {
    emit(LoginState());
  }

  bool get canLogin =>
      !state.hasErrorsInLogin &&
      (state.userEmail?.isNotEmpty ?? false) &&
      (state.password?.isNotEmpty ?? false);

  bool get canRegister =>
      !state.hasErrorsInRegister &&
      (state.userEmail?.isNotEmpty ?? false) &&
      (state.password?.isNotEmpty ?? false) &&
      (state.confirmPassword?.isNotEmpty ?? false);

  bool get canForgetPassword =>
      !state.hasErrorInForgotPassword && (state.userEmail?.isNotEmpty ?? false);

  bool get isValidateEmail =>
      (state.userEmail?.isNotEmpty ?? false) && isEmail(state.userEmail ?? '');

  bool get isValidPassword =>
      (state.password?.isNotEmpty ?? false) &&
      ((state.password?.length ?? 0) >= 6);

  bool get isValidConfirmPassword =>
      (state.password?.isNotEmpty ?? false) &&
      ((state.password?.length ?? 0) >= 6) &&
      (state.password == state.confirmPassword);

  Future register() async {}

  Future logout() async {}

  Future login() async {}

  void setEmail(String? email) {
    add(LoginChangeFormEvent(email: email));
  }

  void setPassword(String? password) {
    add(LoginChangeFormEvent(password: password));
  }
}
