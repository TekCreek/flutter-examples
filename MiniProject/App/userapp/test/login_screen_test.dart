import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:userapp/screens/login_screen.dart'; 

void main() {
  testWidgets('LoginScreen renders and validates inputs', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    expect(find.text('Login'), findsOneWidget);

    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Enter username'), findsOneWidget);
    expect(find.text('Enter password'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), 'user');
    await tester.enterText(find.byType(TextFormField).at(1), 'pass');

    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Enter username'), findsNothing);
    expect(find.text('Enter password'), findsNothing);
  });
}
