import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store/business/bloc/error/error_bloc.dart';
import 'package:store/business/bloc/language/language_bloc.dart';
import 'package:store/business/bloc/product/product_bloc.dart';
import 'package:store/business/bloc/product/product_state.dart';
import 'package:store/business/bloc/theme/theme_bloc.dart';
import 'package:store/business/bloc/user/user_bloc.dart';
import 'package:store/services/app_service.dart';
import 'package:store/ui/screens/home/home.dart';

import '../mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpMock();
  setUpAll(() async {
    await AppService.initialize();
  });

  Widget getApp() {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ErrorBloc>(create: (_) => ErrorBloc()),
          BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
          BlocProvider<LanguageBloc>(create: (_) => LanguageBloc()),
          BlocProvider<UserBloc>(create: (_) => UserBloc()),
          BlocProvider<ProductBloc>(create: (_) => ProductBloc()),
        ],
        child:
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          return const MediaQuery(
              data: MediaQueryData(),
              child: MaterialApp(
                  locale: Locale('vi'),
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  home: HomeScreen()));
        }));
  }

  group('Test home screen', () {
    testWidgets('screen initial', (WidgetTester tester) async {
      await tester.pumpWidget(getApp());
    });
  });
}
