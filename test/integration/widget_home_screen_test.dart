import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store/services/app_service.dart';
import 'package:store/ui/screens/home/home.dart';

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
        data: const MediaQueryData(), child: MaterialApp(home: HomeScreen()));
    return widget;
  }

  group('Test home screen', () {
    /*
    testWidgets('screen initial', (WidgetTester tester) async {
      await tester.pumpWidget(getApp());
    });
    */
  });
}
