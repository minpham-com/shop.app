import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:store/business/bloc/app/app_bloc.dart';
import 'package:store/business/bloc/app/app_state.dart';
import 'package:store/business/bloc/error/error_bloc.dart';
import 'package:store/business/bloc/language/language_bloc.dart';
import 'package:store/business/bloc/theme/theme_bloc.dart';
import 'package:store/business/bloc/user/user_bloc.dart';
import 'package:store/env/app_theme.dart';
import 'package:store/env/env.dart';
import 'package:store/services/locator_service.dart';
import 'package:store/ui/routes/routes.dart';
import 'package:store/ui/screens/home/home.dart';
import 'package:store/ui/screens/login/login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(create: (_) => getIt<AppBloc>()),
        BlocProvider<ErrorBloc>(create: (_) => getIt<ErrorBloc>()),
        BlocProvider<ThemeBloc>(create: (_) => getIt<ThemeBloc>()),
        BlocProvider<LanguageBloc>(create: (_) => getIt<LanguageBloc>()),
        BlocProvider<UserBloc>(create: (_) => getIt<UserBloc>()),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Env.appName,
            theme: BlocProvider.of<ThemeBloc>(context).darkMode
                ? AppThemeData.darkThemeData
                : AppThemeData.lightThemeData,
            routes: Routes.routes,
            locale: Locale(BlocProvider.of<LanguageBloc>(context).locale),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: BlocProvider.of<UserBloc>(context).isLoggedIn
                ? HomeScreen()
                : LoginScreen(),
          );
        },
      ),
    );
  }
}
