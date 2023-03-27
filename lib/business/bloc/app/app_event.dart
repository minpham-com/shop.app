import 'package:store/business/bloc/base_event.dart';

abstract class AppEvent extends BaseEvent {}

class AppStarting extends AppEvent {}

class AppStarted extends AppEvent {}

class AppFinishing extends AppEvent {}

class AppFinished extends AppEvent {}
