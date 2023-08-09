import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/core/use_case/use_case.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';
import 'package:todo/features/todo_list/domain/repositories/todo_list_repository.dart';

class ViewAllTasks extends UseCase<List<Tasks>, NoParams> {
  final TodoListRepository repository;

  ViewAllTasks(this.repository);
  
  @override
  Future<Either<Failure, List<Tasks>>> call(NoParams params) async {
    return await repository.viewAllTasks();
  }
}
