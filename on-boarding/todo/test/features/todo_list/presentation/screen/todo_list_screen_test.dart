import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/features/todo_list/presentation/screens/create_task_screen.dart';
import 'package:todo/todo_app.dart';
import 'package:todo/features/todo_list/presentation/screens/todo_list_screen.dart';
import 'package:todo/features/todo_list/presentation/widgets/custom_button.dart';
import 'package:todo/features/todo_list/presentation/widgets/custom_form_field.dart';
import 'package:todo/features/todo_list/presentation/widgets/custom_widget_background_with_button.dart';
import 'package:todo/features/todo_list/presentation/widgets/task_card.dart';

void main() {
  group("To do list  widget and functionality", () {
    testWidgets("""Screen should be able
     to take to Create task screen
      when Create task button is pressed""", (widgetTester) async {
      await navigateToScreen(widgetTester);
      final curWidget = find.byType(TodoListScreen);
      final boxFinder =
          find.descendant(of: curWidget, matching: find.byType(SizedBox));
      final btnFinder =
          find.descendant(of: boxFinder, matching: find.byType(ElevatedButton));
      expect(btnFinder, findsOneWidget);
      await widgetTester.tap(btnFinder);
      await widgetTester.pumpAndSettle();

      expect(find.byType(TodoListScreen), findsNothing);
      expect(find.byType(CreateTaskScreen), findsOneWidget);
    });

    testWidgets("""Will recieve
     and render data after getting back from Create task screen""",
        (widgetTester) async {
      await navigateToScreen(widgetTester);
      expect(find.byType(TaskCard), findsNothing);

      await widgetTester.tap(find.text('Create Task'));
      await widgetTester.pumpAndSettle();

      const title = 'Task test';
      const dueDate = '2024-10-10';
      const description = 'This is a task description';

      final valueList = [title, dueDate, description];

      for (int i = 0; i < valueList.length; i++) {
        final frmField = find.byType(CustomFormField).at(i);
        final cntr =
            find.descendant(of: frmField, matching: find.byType(TextFormField));
        await widgetTester.enterText(cntr, valueList[i]);
      }

      expect(find.text(title), findsOneWidget);
      expect(find.text(dueDate), findsOneWidget);
      expect(find.text(description), findsOneWidget);

      expect(find.byType(ElevatedButton), findsOneWidget);
      await widgetTester.tap(find.byType(ElevatedButton));
      await widgetTester.pumpAndSettle();

      expect(find.byType(CreateTaskScreen), findsNothing);
      expect(find.byType(TodoListScreen), findsOneWidget);
      expect(find.byType(TaskCard), findsOneWidget);
    });
  });
}

Future<void> navigateToScreen(WidgetTester widgetTester) async {
  await widgetTester.pumpWidget(const TodoApp());
  await widgetTester.pumpAndSettle();

  final bgWidget = find.byType(CustomWidgetBackgroundWithButton);
  final customButton =
      find.descendant(of: bgWidget, matching: find.byType(CustomButton));
  final next =
      find.descendant(of: customButton, matching: find.byType(ElevatedButton));

  await widgetTester.tap(next);
  await widgetTester.pumpAndSettle();
}

