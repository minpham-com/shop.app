import 'package:store/business/bloc/base_state.dart';

class ThemeState extends BaseState {
  final bool isDark;
  ThemeState({this.isDark = false});

  @override
  List<Object?> get props => [isDark];
}
