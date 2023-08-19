import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/use_case/use_case.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';
import 'package:todo/features/todo_list/domain/repositories/todo_list_repository.dart';
import 'package:todo/features/todo_list/domain/use_case/view_all_tasks.dart';

@GenerateNiceMocks([MockSpec<TodoListRepository>()])
import 'view_all_tasks_test.mocks.dart';

void main() {
  late ViewAllTasks usecase;
  late MockTodoListRepository mockTodoListRepository;

  setUp(() {
    mockTodoListRepository = MockTodoListRepository();
    usecase = ViewAllTasks(mockTodoListRepository);
  });

  test('Should be able to call view tasks that is available in repository',
      () async {
    final List<Tasks> tasks = [
    Tasks(
      title: 'Task 1',
      dueDate: DateTime(2023, 8, 10),
      description: 'Description 1',
      id: 'task_1',
      status: false,
    ),
    Tasks(
      title: 'Task 2',
      dueDate: DateTime(2023, 8, 15),
      description: 'Description 2',
      id: 'task_2',
      status: true,
    ),
  ];
    when(mockTodoListRepository.viewAllTasks())
        .thenAnswer((_) async => Right(tasks));
    final result = await usecase(NoParams());
    expect(result, Right(tasks));
    verify(mockTodoListRepository.viewAllTasks());
    verifyNoMoreInteractions(mockTodoListRepository);
  });
}
