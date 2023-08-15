import 'package:dartz/dartz.dart';
import 'package:todo/core/error/exception.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/core/network/network_info.dart';
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
  Future<Either<Failure, List<Tasks>>> viewAllTasks() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTodoList = await remoteDataSource.viewAllTasks();
        localDataSource.cacheCurrentTodoList(remoteTodoList);
        return Right(remoteTodoList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTodoList = await localDataSource.getAllTasks();
        return Right(localTodoList);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Tasks>> viewSpecificTask(String taskId) async {
      try {
        final remoteTodo = await remoteDataSource.viewSpecificTask(taskId);
        return Right(remoteTodo);
      } on ServerException {
        return Left(ServerFailure());
      }
  }
}
