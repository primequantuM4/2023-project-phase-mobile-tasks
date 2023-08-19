import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo/core/use_case/use_case.dart';
import 'package:todo/core/utils/input_converter.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';
import 'package:todo/features/todo_list/domain/use_case/create_task.dart';
import 'package:todo/features/todo_list/domain/use_case/task_use_case.dart';
import 'package:todo/features/todo_list/domain/use_case/view_all_tasks.dart';
import 'package:todo/features/todo_list/domain/use_case/view_specific_task.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final CreateTask createTask;
  final ViewAllTasks viewAllTasks;
  final ViewSpecificTask viewSpecificTask;
  final InputConverter inputConverter;
  TodoListBloc(
      {required this.createTask,
      required this.viewAllTasks,
      required this.viewSpecificTask,
      required this.inputConverter})
      : super(TodoListInitial()) {
    on<GetTasks>(_fetchTasks);
    on<CreateTasks>(_createTask);
    on<CompletedTask>(_completeTask);
    on<GetSpecificTask>(_fetchSpecificTask);
  }
  _fetchTasks(event, emit) async {
    emit(TodoListLoading());
    final taskList = await viewAllTasks(NoParams());

    taskList.fold((failure) => emit(TodoError(failure.toString())), (tasks) {
      if (tasks.isEmpty)
        emit(TodoListEmpty());
      else
        emit(TodoListLoaded(tasks, Status.None));
    });
  }

  _createTask(CreateTasks event, emit) async {
    emit(TodoListLoading());
    await createTask(Params(tasks: event.newTask));
    final newList = await viewAllTasks(NoParams());
    newList.fold((l) => null,
        (taskList) => emit(TodoListLoaded(taskList, Status.CreatedSuccess)));
  }

  _completeTask(CompletedTask event, emit) {
    if (state is TodoListLoaded) {
      final _state = (state as TodoListLoaded);
      TaskUseCase taskUseCase = TaskUseCase(_state.tasks);
      taskUseCase.completeTask(event.taskId);
    }
  }

  _fetchSpecificTask(GetSpecificTask event, emit) async {
    emit(TodoListLoading());
    final task = await viewSpecificTask(event.taskId);

    task.fold((failure) => emit(TodoError(failure.toString())),
        (specifiedTask) => emit(TodoTaskLoaded(specifiedTask)));
  }
}
