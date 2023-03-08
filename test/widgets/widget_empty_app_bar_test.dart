// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store/ui/widgets/empty_app_bar_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // This has the side effect of setting up a mock HTTP client.
  // Disable this with HttpOverrides.global = null;

  setUpAll(() async {});

  Widget getApp() {
    final Widget widget = MediaQuery(
        data: const MediaQueryData(), child: MaterialApp(home: EmptyAppBar()));
    return widget;
  }

  group('Test empty app bar widget', () {
    testWidgets('Initial', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(getApp());
    });
  });
}
