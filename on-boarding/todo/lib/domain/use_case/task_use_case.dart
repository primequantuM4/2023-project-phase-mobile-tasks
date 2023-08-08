import 'package:todo/domain/entity/tasks.dart';

class TaskUseCase {
  List<Tasks> _tasks;
  TaskUseCase(List<Tasks> initialTasks) : _tasks = initialTasks;
  List<Tasks> get tasks => _tasks;

  Tasks createTask(
      String taskName, String taskDescription, DateTime taskDueDate) {
    final newTask = Tasks(taskName, taskDueDate, taskDescription,
        DateTime.now().millisecondsSinceEpoch.toString());
    _tasks.add(newTask);
    return newTask;
  }

  void completeTask(String taskId) {
    final taskIndex = _tasks.indexWhere((task) => task.taskId == taskId);
    if (taskIndex != -1) {
      _tasks[taskIndex].completed = !_tasks[taskIndex].completed;
    }
  }

  Tasks viewSpecificTask(String taskId) {
    final taskIndex = _tasks.indexWhere((element) => element.taskId == taskId);
    return _tasks[taskIndex];
  }

  List<Tasks> viewAllTasks() {
    return tasks;
  }
}
