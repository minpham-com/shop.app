import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store/ui/widgets/textfield_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {});

  Widget getApp() {
    final Widget widget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
            home: TextFieldWidget(
                icon: Icons.person,
                iconColor: Colors.white70,
                textController: TextEditingController(),
                errorText: "Error !!!")));
    return widget;
  }

  group('Test text field widget', () {
    testWidgets('Initial', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(getApp());
    });
  });
}
