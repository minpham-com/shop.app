import 'package:store/data/entities/user.dart';
import 'package:store/data/repository/app_repository.dart';

class UserRepository extends AppRepository<User> {
  UserRepository() : super("users");

  static final UserRepository _instance = UserRepository();

  static UserRepository getInstance() {
    return _instance;
  }
}
