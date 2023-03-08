import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/business/bloc/app/app_bloc.dart';
import 'package:store/business/bloc/error/error_bloc.dart';
import 'package:store/business/bloc/form/login/login_bloc.dart';
import 'package:store/business/bloc/language/language_bloc.dart';
import 'package:store/business/bloc/loading/loading_bloc.dart';
import 'package:store/business/bloc/product/product_bloc.dart';
import 'package:store/business/bloc/theme/theme_bloc.dart';
import 'package:store/business/bloc/user/user_bloc.dart';
import 'package:store/data/repository/app_repository.dart';
import 'package:store/data/repository/product_repository.dart';
import 'package:store/data/repository/repository.dart';
import 'package:store/data/repository/user_repository.dart';
import 'package:store/data/sharedpref/shared_preference_helper.dart';
import 'package:store/di/local_module.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  //log
  getIt.registerSingleton(Logger());
  //bloc
  getIt.registerSingleton(AppBloc());
  getIt.registerSingleton(ThemeBloc());
  getIt.registerSingleton(LanguageBloc());
  getIt.registerSingleton(ErrorBloc());
  getIt.registerSingleton(LoginBloc());
  getIt.registerSingleton(LoadingBloc());
  getIt.registerSingleton(ProductBloc());
  getIt.registerSingleton(UserBloc());

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(""));
  getIt.registerSingleton(AppRepository(""));
  getIt.registerSingleton(ProductRepository());
  getIt.registerSingleton(UserRepository());
}
