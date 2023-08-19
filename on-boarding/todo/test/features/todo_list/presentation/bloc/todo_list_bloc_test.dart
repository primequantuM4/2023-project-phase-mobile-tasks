import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/core/utils/input_converter.dart';
import 'package:todo/features/todo_list/data/models/tasks_model.dart';
import 'package:todo/features/todo_list/domain/use_case/create_task.dart';
import 'package:todo/features/todo_list/domain/use_case/view_all_tasks.dart';
import 'package:todo/features/todo_list/domain/use_case/view_specific_task.dart';
import 'package:todo/features/todo_list/presentation/bloc/bloc.dart';

import '../../../../fixtures/fixture.dart';
import 'todo_list_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ViewAllTasks>(),
  MockSpec<ViewSpecificTask>(),
  MockSpec<CreateTask>(),
  MockSpec<InputConverter>()
])
void main() {
  late TodoListBloc bloc;
  late MockViewAllTasks mockViewAllTasks;
  late MockViewSpecificTask mockViewSpecificTask;
  late MockCreateTask mockCreateTask;
  late MockInputConverter mockInputConverter;

  setUp(() {
    mockViewAllTasks = MockViewAllTasks();
    mockViewSpecificTask = MockViewSpecificTask();
    mockInputConverter = MockInputConverter();
    mockCreateTask = MockCreateTask();
    bloc = TodoListBloc(
        viewAllTasks: mockViewAllTasks,
        createTask: mockCreateTask,
        inputConverter: mockInputConverter,
        viewSpecificTask: mockViewSpecificTask);
  });

  test('InitialState should be initial', () {
    expect(bloc.state, equals(TodoListInitial()));
  });

  group('GetTasks', () {
    final jsonList = jsonDecode(fixture('view_all_tasks.json'));

    final List<TasksModel> tTodoListModel = jsonList["data"]
        .map<TasksModel>((jsonMap) => TasksModel.fromJson(jsonMap))
        .toList();
    final List<TasksModel> tTodoListEmptyModel = [];
    blocTest('''Should call the ViewAllTasks use case and
         return a valid List<Tasks> and emit a loaded state''',
        build: () => bloc,
        act: (bloc) async {
          when(mockViewAllTasks(any))
              .thenAnswer((_) async => Right(tTodoListModel));
          bloc.add(GetTasks());
        },
        expect: () =>
            [TodoListLoading(), TodoListLoaded(tTodoListModel, Status.None)],
        verify: (_) {
          verify(mockViewAllTasks(any));
        });

    blocTest(
      "Should emit TodoListEmpty state when List<Tasks> is empty",
      build: () => bloc,
      act: (bloc) async {
        when(mockViewAllTasks(any))
            .thenAnswer((_) async => Right(tTodoListEmptyModel));
        bloc.add(GetTasks());
      },
      expect: () => [TodoListLoading(), TodoListEmpty()],
    );
    blocTest("Should emit a TodoError State when a Failure occurs",
        build: () => bloc,
        act: (bloc) async {
          when(mockViewAllTasks(any))
              .thenAnswer((_) async => Left(ServerFailure()));
          bloc.add(GetTasks());
        },
        expect: () =>
            [TodoListLoading(), TodoError(ServerFailure().toString())]);
  });

  group("GetSpecificTask", () {
    final tTodoTask = TasksModel(
        title: "Test",
        dueDate: DateTime.parse('2023-10-10'),
        description: "Test Task",
        id: "hgdsf354thfgdf",
        status: false);
    blocTest(
      '''Should call ViewSpecificTask 
    when the event is called and emit a valid loaded state''',
      build: () => bloc,
      act: (bloc) async {
        when(mockViewSpecificTask(any))
            .thenAnswer((realInvocation) async => Right(tTodoTask));
        bloc.add(GetSpecificTask("hgdsf354thfgdf"));
      },
      verify: (_) {
        verify(mockViewSpecificTask(any));
      },
      expect: () => [TodoListLoading(), TodoTaskLoaded(tTodoTask)],
    );

    blocTest('''Should emit an Error state when it 
    fails to fetch data from the repository''',
        build: () => bloc,
        act: (bloc) async {
          when(mockViewSpecificTask(any))
              .thenAnswer((_) async => Left(ServerFailure()));
          bloc.add(GetSpecificTask("hgdsf354thfgdf"));
        },
        expect: () =>
            [TodoListLoading(), TodoError(ServerFailure().toString())]);
  });
  group('CreateTasks', () {
    final List<TasksModel> tTodoList = [];
    final tTodoTask = TasksModel(
        title: "Test",
        dueDate: DateTime.parse('2023-10-10'),
        description: "Test Task",
        id: "hgdsf354thfgdf",
        status: false);
    blocTest('''Should be able to call the CreateTask 
    use case and also emit a valid loading state''',
        build: () => bloc,
        act: (bloc) async {
          when(mockCreateTask(any)).thenAnswer((_) async => Right(tTodoTask));
          when(mockViewAllTasks(any))
              .thenAnswer((_) async => Right(<TasksModel>[]));
          bloc.add(CreateTasks(tTodoTask));
        },
        verify: (_) {
          verify(mockCreateTask(any));
        },
        expect: () => [
              TodoListLoading(),
              TodoListLoaded(tTodoList, Status.CreatedSuccess)
            ]);
  });
}
