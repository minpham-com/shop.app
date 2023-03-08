import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/services/locator_service.dart';
import 'package:store/ui/screens/login/login.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await LocatorService.initialize();
  });

  Widget getApp() {
    final Widget widget = MediaQuery(
        data: const MediaQueryData(), child: MaterialApp(home: LoginScreen()));
    return widget;
  }

  group('Test login screen', () {
    testWidgets('screen initial', (WidgetTester tester) async {
      await tester.pumpWidget(getApp());
    });
  });
}
