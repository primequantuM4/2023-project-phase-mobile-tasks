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

  const TodoListLoaded(this.tasks);

  @override
  List<Object> get props => [tasks];
}

final class TodoError extends TodoListState {
  final String message;

  TodoError(this.message);

  @override
  List<Object> get props => [message];
}
