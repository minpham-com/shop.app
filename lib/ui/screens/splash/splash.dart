import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/services/constants/preferences.dart';
import 'package:store/env/assets.dart';
import 'package:store/ui/routes/routes.dart';
import 'package:store/ui/widgets/app_icon_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(child: AppIconWidget(image: Assets.appLogo)),
    );
  }

  Timer startTimer() {
    return Timer(const Duration(milliseconds: 2000), navigate);
  }

  Future<void> navigate() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool isLogged =
        preferences.getBool(Preferences.is_logged_in) ?? false;
    final String route = isLogged ? Routes.home : Routes.login;
    if (context.mounted) return;
    Navigator.of(context).pushReplacementNamed(route);
  }
}
