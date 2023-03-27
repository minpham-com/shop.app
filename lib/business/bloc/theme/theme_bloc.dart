import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business/bloc/base_event.dart';
import 'package:store/business/bloc/theme/theme_event.dart';
import 'package:store/business/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<BaseEvent, ThemeState> {
  // store for handling errors

  bool get darkMode => state.isDark;

  ThemeBloc() : super(ThemeState());
  // ignore: avoid_positional_boolean_parameters
  Future<dynamic> changeBrightnessToDark(bool value) async {
    add(ThemeEvent(isDark: value));
  }

  bool isPlatformDark(BuildContext context) =>
      MediaQuery.platformBrightnessOf(context) == Brightness.dark;

  void dispose() {}
}
