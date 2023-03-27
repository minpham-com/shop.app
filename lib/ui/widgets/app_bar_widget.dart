import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:store/business/bloc/theme/theme_bloc.dart';
import 'package:store/services/constants/preferences.dart';
import 'package:store/services/shared_preference_service.dart';
import 'package:store/ui/routes/routes.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final SharedPreferenceService store = SharedPreferenceService.getInstance();

  AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildAppBar(context);
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.home_tv_posts),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      _buildLanguageButton(context),
      _buildThemeButton(context),
      _buildLogoutButton(context),
    ];
  }

  Widget _buildThemeButton(BuildContext context) {
    final ThemeBloc bloc = context.read<ThemeBloc>();
    return IconButton(
      onPressed: () {
        bloc.changeBrightnessToDark(!bloc.darkMode);
      },
      icon: Icon(
        bloc.darkMode ? Icons.brightness_5 : Icons.brightness_3,
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return IconButton(
      onPressed: () async {
        store.setBool(key: Preferences.is_logged_in, value: false);
        Navigator.of(context).pushReplacementNamed(Routes.login);
      },
      icon: const Icon(
        Icons.power_settings_new,
      ),
    );
  }

  Widget _buildLanguageButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        _buildLanguageDialog(context);
      },
      icon: const Icon(
        Icons.language,
      ),
    );
  }

  void _buildLanguageDialog(BuildContext context) {
    _showDialog<String>(
        context: context,
        child: Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What do you want to remember?'),
                  ),
                  SizedBox(
                    width: 320.0,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _showDialog<T>({required BuildContext context, required Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T? value) {
      // The value passed to Navigator.pop() or null.
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
