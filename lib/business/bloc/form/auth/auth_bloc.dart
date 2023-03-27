import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business/bloc/base_event.dart';
import 'package:store/business/bloc/form/auth/auth_event.dart';
import 'package:store/business/bloc/form/auth/auth_state.dart';
import 'package:store/business/bloc/form/form_bloc.dart';
import 'package:store/services/log_service.dart';
import 'package:store/services/network/api/auth_api_service.dart';
import 'package:store/services/shared_preference_service.dart';
import 'package:validators/validators.dart';

class AuthBloc extends FormBloc<BaseEvent, AuthState> {
  static const String _tag = 'AuthBloc';

  final LogService _log = LogService.getInstance();
  final AuthApiService authService = AuthApiService.getInstance();
  final SharedPreferenceService sharedPreferenceService =
      SharedPreferenceService.getInstance();

  AuthBloc() : super(AuthState()) {
    on<RegisterSubmit>(_submitRegister);
    on<ForgotPasswordSubmit>(_forgotPassword);
    on<ForgotPasswordRequestSubmit>(_forgotPasswordRequest);
    on<LoginSubmit>(_submitLogin);
    on<LoginOut>(_logout);
    on<AuthChangeFormEvent>(_formChange);
    on<UserNameChanged>(_userNameChange);
    on<PasswordChanged>(_passwordChange);
    on<ConfirmPasswordChanged>(_confirmPasswordChange);
  }

  Future<void> _userNameChange(
      UserNameChanged event, Emitter<AuthState> emit) async {
    emit(state.copyWith(user: event.userName));
    _log.d(
      state.toString(),
    );
  }

  Future<void> _passwordChange(
      PasswordChanged event, Emitter<AuthState> emit) async {
    _log.d(
      state.toString(),
    );
    emit(state.copyWith(userPassword: event.password));
  }

  Future<void> _confirmPasswordChange(
      ConfirmPasswordChanged event, Emitter<AuthState> emit) async {
    _log.d(
      state.toString(),
    );
    emit(state.copyWith(userConfirmPassword: event.confirmPassword));
  }

  Future<bool> _submitLogin(LoginSubmit event, Emitter<AuthState> emit) async {
    emit(state.copyWith(actionLoading: true));
    try {
      final Response<dynamic> response =
          await authService.login(state.userName, state.password);
      await sharedPreferenceService.saveUser(response.data);
      await sharedPreferenceService.saveIsLoggedIn(true);
      return true;
    } catch (e) {
      await sharedPreferenceService.saveIsLoggedIn(false);
      _log.e(e.toString());
    } finally {
      emit(state.copyWith(actionLoading: false));
    }
    return false;
  }

  Future<void> _submitRegister(
      RegisterSubmit event, Emitter<AuthState> emit) async {
    _log.d(
      state.toString(),
    );
  }

  Future<void> _forgotPassword(
      ForgotPasswordSubmit event, Emitter<AuthState> emit) async {
    _log.d(
      state.toString(),
    );
  }

  Future<void> _forgotPasswordRequest(
      ForgotPasswordRequestSubmit event, Emitter<AuthState> emit) async {
    _log.d(
      state.toString(),
    );
  }

  Future<void> _formChange(
      AuthChangeFormEvent event, Emitter<AuthState> emit) async {
    _log.d(
      state.toString(),
    );
    emit(state.copyWith());
  }

  Future<void> _logout(LoginOut event, Emitter<AuthState> emit) async {
    _log.d(
      _tag,
    );
    await authService.logout();
    emit(AuthState());
  }

  bool get loading => state.loading;

  bool get canLogin => isValidateEmail && isValidPassword;

  bool get canRegister =>
      isValidateEmail && isValidPassword && isValidConfirmPassword;

  bool get canForgot => isValidateEmail;

  bool get isValidateEmail =>
      (state.userName.isNotEmpty) && isEmail(state.userName);

  bool get isValidPassword =>
      (state.password.isNotEmpty) && ((state.password.length) >= 6);

  bool get isValidConfirmPassword =>
      (state.password.isNotEmpty) &&
      ((state.password.length) >= 6) &&
      (state.password == state.confirmPassword);

  Future<dynamic> register() async {
    _log.d(
      _tag,
    );
  }

  Future<dynamic> logout() async {
    _log.d(
      _tag,
    );
    add(LoginOut());
  }

  Future<dynamic> login() async {
    _log.d(
      _tag,
    );
    if (canLogin) {
      add(LoginSubmit());
    }
  }

  void setEmail(String email) {
    add(UserNameChanged(email));
    _log.d(
      _tag,
    );
  }

  void setPassword(String password) {
    add(PasswordChanged(password));
    _log.d(
      _tag,
    );
  }
}
