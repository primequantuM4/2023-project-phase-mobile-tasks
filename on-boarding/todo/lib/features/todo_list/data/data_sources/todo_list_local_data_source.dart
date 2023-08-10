import '../models/tasks_model.dart';

abstract class TodoListLocalDataSource {
  Future<void> cacheCurrentTodoList(List<TasksModel> todoListToCache);
  Future<List<TasksModel>> getAllTasks();
}
