part of 'todo_list_bloc.dart';

@immutable
sealed class TodoListState extends Equatable {
  const TodoListState();

  @override
  List<Object?> get props => [];
}

class TodoListInitial extends TodoListState { }

class TodoListLoading extends TodoListState { }

final class TodoListLoaded extends TodoListState {
  final List<Tasks> tasks;

  const TodoListLoaded(this.tasks);

  @override
  List<Object> get props => [tasks];
}