import 'package:get_it/get_it.dart';
//import 'package:logger/logger.dart';
//import 'package:shared_preferences/shared_preferences.dart';
/*
import 'package:store/business/bloc/app/app_bloc.dart';
import 'package:store/business/bloc/error/error_bloc.dart';
import 'package:store/business/bloc/form/login/login_bloc.dart';
import 'package:store/business/bloc/language/language_bloc.dart';
import 'package:store/business/bloc/loading/loading_bloc.dart';
import 'package:store/business/bloc/product/product_bloc.dart';
import 'package:store/business/bloc/theme/theme_bloc.dart';
import 'package:store/business/bloc/user/user_bloc.dart';
import 'package:store/data/repository/app_repository.dart';
*/
import 'package:store/data/repository/product_repository.dart';
import 'package:store/data/repository/repository.dart';
import 'package:store/data/repository/user_repository.dart';
import 'package:store/services/base_service.dart';
import 'package:store/services/data/box_source_service.dart';

final getIt = GetIt.instance;

class LocatorService extends BaseService {
  static Future<void> initialize() async {
    // repository:----------------------------------------------------------------
    getIt.registerSingleton(() => Repository(""));
    getIt.registerSingleton(() => ProductRepository());
    getIt.registerSingleton(() => UserRepository());
    getIt.registerSingleton(() => BoxSourceService());
  }
}
