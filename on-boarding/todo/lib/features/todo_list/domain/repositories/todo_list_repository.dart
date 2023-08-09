import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';

abstract class TodoListRepository {
  Future<Either<Failure, List<Tasks>>> viewAllTasks();
  Future<Either<Failure, String>> viewSpecificTask();
  Future<Either<Failure, Tasks>> createTask(Tasks tasks);
}

