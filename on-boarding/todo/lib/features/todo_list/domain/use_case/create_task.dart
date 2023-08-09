import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/core/use_case/use_case.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';
import 'package:todo/features/todo_list/domain/repositories/todo_list_repository.dart';

class CreateTask extends UseCase<Tasks, Params> {
  final TodoListRepository repository;

  CreateTask(this.repository);
  @override
  Future<Either<Failure, Tasks>> call(Params params) async {
   return await repository.createTask(params.tasks);
  }
}

class Params extends Equatable {
  final Tasks tasks;
  Params({required this.tasks});

  @override
  List<Object> get props => [tasks];
}
