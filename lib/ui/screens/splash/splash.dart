import 'dart:async';

import 'package:flutter/material.dart';
import 'package:store/env/assets.dart';
import 'package:store/services/constants/preferences.dart';
import 'package:store/services/shared_preference_service.dart';
import 'package:store/ui/routes/routes.dart';
import 'package:store/ui/screens/base_page.dart';
import 'package:store/ui/screens/base_state.dart';
import 'package:store/ui/screens/mixin_widget.dart';
import 'package:store/ui/widgets/app_icon_widget.dart';

class SplashScreen extends BasePage {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen>
    with WidgetMixin<SplashScreen> {
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
    final bool isLogged = await SharedPreferenceService.getInstance()
            .getBool(Preferences.is_logged_in) ??
        false;
    final String route = isLogged ? Routes.home : Routes.login;
    if (context.mounted) return;
    navigateTo(context, route);
  }
}
