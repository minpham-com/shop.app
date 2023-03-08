import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business/bloc/theme/theme_event.dart';
import 'package:store/business/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  // store for handling errors

  bool get darkMode => state.isDark;

  ThemeBloc() : super(ThemeState(false));
  // ignore: avoid_positional_boolean_parameters
  Future changeBrightnessToDark(bool value) async {
    add(ThemeEvent(value));
  }

  bool isPlatformDark(BuildContext context) =>
      MediaQuery.platformBrightnessOf(context) == Brightness.dark;

  void dispose() {}
}
