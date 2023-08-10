import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/features/todo_list/presentation/screens/get_started_screen.dart';
import 'package:todo/todo_app.dart';
import 'package:todo/features/todo_list/presentation/screens/todo_list_screen.dart';
import 'package:todo/features/todo_list/presentation/widgets/custom_button.dart';
import 'package:todo/features/todo_list/presentation/widgets/custom_widget_background_with_button.dart';

void main() {
  group('Get started screen test', () {
    testWidgets("Custom background and button exsists",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: GetStartedScreen()));
      expect(find.byType(CustomWidgetBackgroundWithButton), findsOneWidget);
    });

    testWidgets("""Get Started Screen will go
     to the To do list when button is pressed""", (WidgetTester tester) async {
      await tester.pumpWidget(const TodoApp());
      await tester.pumpAndSettle();

      expect(find.byType(GetStartedScreen), findsOneWidget);

      final backgroundWidget = find.byType(CustomWidgetBackgroundWithButton);

      final customButton = find.descendant(
        of: backgroundWidget,
        matching: find.byType(CustomButton),
      );
      final buttonFinder = find.descendant(
          of: customButton, matching: find.byType(ElevatedButton));

      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(GetStartedScreen), findsNothing);
      expect(find.byType(TodoListScreen), findsOneWidget);
    });
  });
}
