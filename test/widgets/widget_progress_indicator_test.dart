// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store/ui/widgets/progress_indicator_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // This has the side effect of setting up a mock HTTP client.
  // Disable this with HttpOverrides.global = null;

  setUpAll(() async {});

  Widget getApp() {
    const Widget widget = MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(home: CustomProgressIndicatorWidget()));
    return widget;
  }

  group('Test progress indicator widget', () {
    testWidgets('Initial', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(getApp());
    });
  });
}
