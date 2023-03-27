import 'package:store/business/bloc/base_event.dart';

abstract class UserEvent extends BaseEvent {}

class UserLoading extends UserEvent {}

class UserLoginned extends UserEvent {}

class UserLogout extends UserEvent {}
