import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/screens/todo_app.dart';
import 'package:todo/screens/todo_list_screen.dart';
import 'package:todo/screens/view_task.dart';
import 'package:todo/widgets/custom_button.dart';
import 'package:todo/widgets/custom_form_field.dart';
import 'package:todo/widgets/custom_widget_background_with_button.dart';
import 'package:todo/widgets/task_card.dart';

void main() {
  testWidgets(
      "A task information should be available when pressing the TaskCards",
      (widgetTester) async {
    await addTaskToScreen(widgetTester);
    expect(find.byType(TodoListScreen), findsOneWidget);
    expect(find.byType(InkWell), findsWidgets);
    final cardTap = find.byType(InkWell).at(0);
    final tCard = find.descendant(of: cardTap, matching: find.byType(TaskCard));
    expect(tCard, findsOneWidget);

    await widgetTester.tap(tCard);
    await widgetTester.pumpAndSettle();

    expect(find.byType(TodoListScreen), findsNothing);
    expect(find.byType(ViewTask), findsOneWidget);

    expect(find.text("A2SV tasks"), findsOneWidget);
    expect(find.text("Oct 10, 2023"), findsOneWidget);
    expect(find.text("Tasks in A2SV"), findsOneWidget);
  });
}

Future<void> navigateToScreen(WidgetTester widgetTester) async {
  await widgetTester.pumpWidget(TodoApp());
  await widgetTester.pumpAndSettle();

  final bgWidget = find.byType(CustomWidgetBackgroundWithButton);
  final customButton =
      find.descendant(of: bgWidget, matching: find.byType(CustomButton));
  final next =
      find.descendant(of: customButton, matching: find.byType(ElevatedButton));

  await widgetTester.tap(next);
  await widgetTester.pumpAndSettle();
}

Future<void> addTaskToScreen(WidgetTester tester) async {
  await navigateToScreen(tester);
  await tester.tap(find.text('Create Task'));
  await tester.pumpAndSettle();

  final taskName = "A2SV tasks";
  final dueDate = "2023-10-10";
  final description = "Tasks in A2SV";

  final valueList = [taskName, dueDate, description];

  for (int i = 0; i < valueList.length; i++) {
    final frmField = find.byType(CustomFormField).at(i);
    final cntr =
        find.descendant(of: frmField, matching: find.byType(TextFormField));

    await tester.enterText(cntr, valueList[i]);
  }

  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle();
}
