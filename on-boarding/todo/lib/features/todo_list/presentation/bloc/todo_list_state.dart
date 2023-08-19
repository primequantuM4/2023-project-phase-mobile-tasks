part of 'todo_list_bloc.dart';

@immutable
sealed class TodoListState extends Equatable {
  const TodoListState();

  @override
  List<Object?> get props => [];
}

final class TodoListEmpty extends TodoListState {}

final class TodoListInitial extends TodoListState {}

final class TodoListLoading extends TodoListState {}

final class TodoListLoaded extends TodoListState {
  final List<Tasks> tasks;
  final Status stateError;

  const TodoListLoaded(this.tasks, this.stateError);

  @override
  List<Object> get props => [tasks, stateError];
}

final class TodoTaskLoaded extends TodoListState {
  final Tasks task;

  TodoTaskLoaded(this.task);

  @override
  List<Object> get props => [task];
}

final class TodoError extends TodoListState {
  final String message;

  TodoError(this.message);

  @override
  List<Object> get props => [message];
}

enum Status {
  None,
  CreatedSuccess,
  InputError,
  EditSuccess,
}
