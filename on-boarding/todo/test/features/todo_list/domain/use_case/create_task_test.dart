import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';
import 'package:todo/features/todo_list/domain/repositories/todo_list_repository.dart';
import 'package:todo/features/todo_list/domain/use_case/create_task.dart';
@GenerateNiceMocks([MockSpec<TodoListRepository>()])
import 'create_task_test.mocks.dart';

void main() {
  late MockTodoListRepository mockTodoListRepository;
  late CreateTask usecase;

  setUp(() {
    mockTodoListRepository = MockTodoListRepository();
    usecase = CreateTask(mockTodoListRepository);
  });
  test("""should be able to call the repository when creating a task""",
      () async {
    final Tasks tasks = Tasks(
        title: "",
        dueDate: DateTime.now(),
        description: "",
        id: "id",
        status: false);
    when(mockTodoListRepository.createTask(tasks))
        .thenAnswer((_) async => Right(tasks));
    final result = await usecase(Params(tasks: tasks));

    expect(result, Right(tasks));
    verify(mockTodoListRepository.createTask(tasks));
    verifyNoMoreInteractions(mockTodoListRepository);
  });
}
