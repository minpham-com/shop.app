import 'package:store/business/bloc/base_state.dart';

class UserState extends BaseState {
  final bool success;

  final bool loading;

  final bool isLoggedIn;

  UserState(
      {this.success = true, this.loading = false, this.isLoggedIn = false});

  factory UserState.initial() {
    return UserState();
  }

  @override
  List<Object?> get props => [success, loading, isLoggedIn];
}
