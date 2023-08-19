import 'package:todo/features/todo_list/domain/entity/tasks.dart';

class TaskUseCase {
  final List<Tasks> _tasks;
  TaskUseCase(List<Tasks> initialTasks) : _tasks = initialTasks;
  List<Tasks> get tasks => _tasks;

  Tasks createTask(
      String taskName, String taskDescription, DateTime taskDueDate) {
    final newTask = Tasks(
        title: taskName,
        dueDate: taskDueDate,
        description: taskDescription,
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        status: false);
    _tasks.add(newTask);
    return newTask;
  }

  void completeTask(String id) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex] =
          _tasks[taskIndex].copyWith(status: !_tasks[taskIndex].status);
    }
  }

  Tasks viewSpecificTask(String id) {
    final taskIndex = _tasks.indexWhere((element) => element.id == id);
    return _tasks[taskIndex];
  }

  void editTask(
      {required String id,
      String? taskName,
      DateTime? dueDate,
      String? description,
      bool? status}) {
    final taskIndex = _tasks.indexWhere((element) => element.id == id);
    if (taskIndex != -1)
      _tasks[taskIndex] = _tasks[taskIndex].copyWith(
        title: taskName,
        dueDate: dueDate,
        description: description,
        status: status
      );
  }

  List<Tasks> viewAllTasks() {
    return tasks;
  }
}
