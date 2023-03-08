import 'package:store/data/models/user.dart';
import 'package:store/data/repository/app_repository.dart';

class UserRepository extends AppRepository<User> {
  UserRepository() : super("users");
}
