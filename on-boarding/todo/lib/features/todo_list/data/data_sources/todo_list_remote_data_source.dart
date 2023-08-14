import 'package:todo/features/todo_list/data/models/tasks_model.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';

abstract class TodoListRemoteDataSource {
  Future<TasksModel> createTask(Tasks tasks);
  Future<List<TasksModel>> viewAllTasks();
  Future<TasksModel> viewSpecificTask(String taskId);
}
