import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/core/use_case/use_case.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';
import 'package:todo/features/todo_list/domain/repositories/todo_list_repository.dart';

class ViewSpecificTask extends UseCase<Tasks, String> {
  final TodoListRepository repository;

  ViewSpecificTask(this.repository);
  @override
  Future<Either<Failure, Tasks>> call(String params) async {
    return await repository.viewSpecificTask(params);
  }
}
