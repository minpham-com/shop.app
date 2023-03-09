import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business/bloc/error/error_bloc.dart';
import 'package:store/business/bloc/error/error_event.dart';
import 'package:store/business/bloc/user/user_event.dart';
import 'package:store/business/bloc/user/user_state.dart';
import 'package:store/data/repository/user_repository.dart';
import 'package:store/services/locator_service.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // repository instance
  late final UserRepository _repository = getIt<UserRepository>();

  // store for handling error messages
  final ErrorBloc _errorBag = ErrorBloc();

  // constructor:---------------------------------------------------------------
  UserBloc() : super(UserState.initial());

  bool get success => state.success;

  bool get isLoading => state.loading;

  bool get isLoggedIn => state.isLoggedIn;

  Future login(String email, String password) async {
    final future = _repository.login(email, password);
    await future.then((value) async {
      if (value) {
        _repository.saveIsLoggedIn(value: true);
        add(UserLoginned());
      } else {
        print('failed to login');
      }
    }).catchError((Object e) {
      print(e);
      _errorBag.add(ErrorEvent(e.toString()));
      throw e;
    });
  }

  void logout() {
    add(UserLogout());
    _repository.saveIsLoggedIn(value: false);
  }
}
