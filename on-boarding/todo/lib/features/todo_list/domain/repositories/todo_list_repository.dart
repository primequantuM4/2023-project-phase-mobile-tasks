import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';

abstract class TodoListRepository {
  Future<Either<Failure, Tasks>> getAllTasks();
  Future<Either<Failure, Tasks>> getSpecificTask();
}
