import 'package:json_annotation/json_annotation.dart';
import 'package:store/business/bloc/form/form_state.dart';

part 'auth_state.g.dart';

@JsonSerializable()
class AuthState extends FormState {
  final String userName;

  final String password;

  final String confirmPassword;

  final bool loading;

  AuthState(
      {this.userName = '',
      this.password = '',
      this.confirmPassword = '',
      this.loading = false});

  AuthState copyWith(
      {String? user,
      String? userPassword,
      String? userConfirmPassword,
      bool? actionLoading}) {
    return AuthState(
        userName: user ?? userName,
        password: userPassword ?? password,
        confirmPassword: userConfirmPassword ?? confirmPassword,
        loading: actionLoading ?? loading);
  }

  @override
  List<Object?> get props => [userName, password, confirmPassword, loading];
}
