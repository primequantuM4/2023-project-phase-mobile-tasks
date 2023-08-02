import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_3/bad_code';
 void main() {
  testWidgets('Test name registration and clearing', (WidgetTester tester) async {
    await tester.pumpWidget(NApp()); 
    // Find the TextField by its type
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    // Enter a name in the text field and tap the submit button
    await tester.enterText(textFieldFinder, 'John Doe');
    await tester.tap(find.text('Submit'));
    await tester.pump();

    // Verify that the name is added to the list
    expect(find.text('John Doe'), findsOneWidget);

    // Clear the text field and tap the submit button again
    await tester.enterText(textFieldFinder, ''); // Clear the text field
    await tester.tap(find.text('Submit'));
    await tester.pump();

    // Verify that the list is still showing the previously entered name
    expect(find.text('John Doe'), findsOneWidget);
    // Verify that the text field is cleared after submitting
    expect(find.text(''), findsOneWidget);
  });
}
