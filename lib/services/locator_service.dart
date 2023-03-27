import 'package:get_it/get_it.dart';
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
