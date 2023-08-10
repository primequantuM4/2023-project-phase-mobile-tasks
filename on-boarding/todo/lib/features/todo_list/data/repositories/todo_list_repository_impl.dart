import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/core/platform/network_info.dart';
import 'package:todo/features/todo_list/data/data_sources/todo_list_local_data_source.dart';
import 'package:todo/features/todo_list/data/data_sources/todo_list_remote_data_source.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';
import 'package:todo/features/todo_list/domain/repositories/todo_list_repository.dart';

class TodoListRepositoryImpl implements TodoListRepository {
  final NetworkInfo networkInfo;
  final TodoListLocalDataSource localDataSource;
  final TodoListRemoteDataSource remoteDataSource;

  TodoListRepositoryImpl(
      {required this.networkInfo,
      required this.localDataSource,
      required this.remoteDataSource});

  @override
  Future<Either<Failure, Tasks>> createTask(Tasks tasks) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Tasks>>> viewAllTasks() {
    // TODO: implement viewAllTasks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Tasks>> viewSpecificTask() {
    // TODO: implement viewSpecificTask
    throw UnimplementedError();
  }
}
