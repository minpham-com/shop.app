import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store/ui/widgets/rounded_button_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {});

  Widget getApp() {
    final Widget widget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
            home: RoundedButtonWidget(
          buttonText: "Test",
          buttonColor: Colors.orangeAccent,
          onPressed: () {
            print("Button clicked");
          },
        )));
    return widget;
  }

  group('Test rounded button widget', () {
    testWidgets('Initial', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(getApp());
    });
  });
}
