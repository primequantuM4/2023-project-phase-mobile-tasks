part of 'todo_list_bloc.dart';

@immutable
sealed class TodoListEvent {}
class GetTasks extends TodoListEvent {}
class CompletedTask extends TodoListEvent {
  final String taskId;

  CompletedTask(this.taskId);
}

class CreateTask extends TodoListEvent {
  final Tasks newTask;

  CreateTask(this.newTask);
}
