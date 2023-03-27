import 'package:store/business/bloc/base_event.dart';

class ThemeEvent extends BaseEvent {
  final bool isDark;

  ThemeEvent({this.isDark = false});

  @override
  List<Object?> get props => [isDark];
}
