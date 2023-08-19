part of 'todo_list_bloc.dart';

@immutable
sealed class TodoListEvent {}

class GetTasks extends TodoListEvent {}

class GetSpecificTask extends TodoListEvent {
  final String taskId;
  GetSpecificTask(this.taskId);
}

class CompletedTask extends TodoListEvent {
  final String taskId;

  CompletedTask(this.taskId);
}

class CreateTasks extends TodoListEvent {
  final Tasks newTask;

  CreateTasks(this.newTask);
}
