import 'package:flutter_test/flutter_test.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';
import 'package:todo/features/todo_list/domain/use_case/task_use_case.dart';


void main() {
  late TaskUseCase tuc;
  setUp(() {
    tuc = TaskUseCase([]);
  });
  group("Tasks use case", () {
    test('Task use case should be able to create a task', () {
      const String title = "X";
      const String taskDescription = "Y";
      final date = DateTime.now();
      tuc.createTask(title, taskDescription, date);
      expect(tuc.tasks.length, 1);
    });

    test('Create Task should be able to return of Type Tasks', () {
      final result = tuc.createTask("X", "y", DateTime.now());
      expect(result, isA<Tasks>());
    });

    test('Tasks should be marked status when a method is called', () {
      final task = tuc.createTask("X", "Y", DateTime.now());
      final taskIndex = tuc.tasks.indexWhere(
        (element) => task.id == element.id,
      );
      expect(tuc.tasks[taskIndex].status, false);
      tuc.completeTask(task.id);
      expect(tuc.tasks[taskIndex].status, true);
    });
  });
}
