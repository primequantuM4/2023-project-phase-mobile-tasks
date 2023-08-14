import '../models/tasks_model.dart';

abstract class TodoListLocalDataSource {
  Future<void> cacheCurrentTodoList(List<TasksModel> todoListToCache);
  Future<void> cacheCurrentTask(TasksModel task);
  Future<List<TasksModel>> getAllTasks();
  Future<TasksModel> getSpecificTask(String taskId);
}
