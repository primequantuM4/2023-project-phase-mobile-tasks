import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';
import 'package:todo/features/todo_list/domain/repositories/todo_list_repository.dart';
import 'package:todo/features/todo_list/domain/use_case/view_specific_task.dart';

import 'view_specific_task_test.mocks.dart';



@GenerateNiceMocks([MockSpec<TodoListRepository>()])
void main() {
  late ViewSpecificTask usecase;
  late MockTodoListRepository mockTodoListRepository;

  setUp(() {
    mockTodoListRepository = MockTodoListRepository();
    usecase = ViewSpecificTask(mockTodoListRepository);
  });

  test('Should be able to get a specific task that is available in repository',
      () async {
    final Tasks task = Tasks(
        title: "Task",
        dueDate: DateTime.now(),
        description: " description",
        id: "id",
        status: false);
    when(mockTodoListRepository.viewSpecificTask(any))
        .thenAnswer((_) async => Right(task));
    final result = await usecase("id");
    expect(result, Right(task));
    verify(mockTodoListRepository.viewSpecificTask(any));
    verifyNoMoreInteractions(mockTodoListRepository);
  });
}
