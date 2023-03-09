import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
    final Widget widget = MediaQuery(
        data: const MediaQueryData(), child: MaterialApp(home: LoginScreen()));
    return widget;
  }

  group('Test login screen', () {
    /*
    testWidgets('screen initial', (WidgetTester tester) async {
      await tester.pumpWidget(getApp());
    });
    */
  });
}
