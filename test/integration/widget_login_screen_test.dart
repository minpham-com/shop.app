import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store/business/bloc/error/error_bloc.dart';
import 'package:store/business/bloc/form/login/login_bloc.dart';
import 'package:store/business/bloc/form/login/login_state.dart';
import 'package:store/business/bloc/language/language_bloc.dart';
import 'package:store/business/bloc/theme/theme_bloc.dart';
import 'package:store/business/bloc/user/user_bloc.dart';
import 'package:store/services/app_service.dart';
import 'package:store/ui/screens/login/login.dart';

import '../mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpMock();
  setUpAll(() async {
    await AppService.initialize();
  });

  // ignore: unused_element
  Widget getApp() {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ErrorBloc>(create: (_) => ErrorBloc()),
          BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
          BlocProvider<LanguageBloc>(create: (_) => LanguageBloc()),
          BlocProvider<UserBloc>(create: (_) => UserBloc()),
          BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
        ],
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return MediaQuery(
              data: const MediaQueryData(),
              child: MaterialApp(
                  locale: const Locale('vi'),
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  home: LoginScreen()));
        }));
  }

  group('Test login screen', () {
    /*
    testWidgets('screen initial', (WidgetTester tester) async {
      await tester.pumpWidget(getApp());
    });
    */
  });
}
