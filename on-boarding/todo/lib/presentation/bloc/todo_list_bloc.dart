import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo/domain/entity/tasks.dart';
import 'package:todo/domain/use_case/task_use_case.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListInitial()) {
    on<GetTasks>(_fetchTasks);
    on<CreateTask>(_createTask);
    on<CompletedTask>(_completeTask);
  }
  _fetchTasks(event, emit) async {
    emit(TodoListLoading());
    //simulating data here
    await Future.delayed(Duration(seconds: 1));
    List<Tasks> fetchedTasks = [];
    emit(TodoListLoaded(fetchedTasks));
  }

  _createTask(CreateTask event, emit) {
    if (state is TodoListLoaded) {
      final _state = (state as TodoListLoaded);
      TaskUseCase _taskUseCase = TaskUseCase(_state.tasks);
      _taskUseCase.createTask(event.newTask.taskName, event.newTask.description,
          event.newTask.dueDate);
      emit(TodoListLoaded(List.of(_taskUseCase.tasks)));
    }
  }

  _completeTask(CompletedTask event, emit) {
    if (state is TodoListLoaded) {
      final _state = (state as TodoListLoaded);
      TaskUseCase _taskUseCase = TaskUseCase(_state.tasks);
      _taskUseCase.completeTask(event.taskId);
    }
  }
}
