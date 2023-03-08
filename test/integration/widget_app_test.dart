// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/services/locator_service.dart';
import 'package:store/ui/screens/my_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // This has the side effect of setting up a mock HTTP client.
  // Disable this with HttpOverrides.global = null;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await LocatorService.initialize();
  });

  group('Test main app widget', () {
    testWidgets('main app widget initial', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());
    });
  });
}
