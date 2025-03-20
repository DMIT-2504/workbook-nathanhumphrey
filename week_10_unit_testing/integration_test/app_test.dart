import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:week_10_unit_testing/main.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized;

  group('End-to-end Tests', () {
    testWidgets('UserWidget toggles name and email display on fab tap', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MainApp());

      final nameFinder = find.text('Name: Jane Doe');
      final emailFinder = find.text('Mail: jdoe@example.com');
      final fabFinder = find.byType(FloatingActionButton);

      await tester.tap(fabFinder);

      await tester.pump(const Duration(seconds: 1));

      expect(nameFinder, findsOneWidget);
      expect(emailFinder, findsOneWidget);
    });
  });
}
