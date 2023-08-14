import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/error/exception.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/core/platform/network_info.dart';
import 'package:todo/features/todo_list/data/data_sources/todo_list_local_data_source.dart';
import 'package:todo/features/todo_list/data/data_sources/todo_list_remote_data_source.dart';
import 'package:todo/features/todo_list/data/models/tasks_model.dart';
import 'package:todo/features/todo_list/data/repositories/todo_list_repository_impl.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';

import 'todo_list_repositroy_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<TodoListRemoteDataSource>(),
  MockSpec<TodoListLocalDataSource>(),
  MockSpec<NetworkInfo>()
])
void main() {
  late MockTodoListRemoteDataSource remoteDataSource;
  late MockTodoListLocalDataSource localDataSource;
  late MockNetworkInfo networkInfo;
  late TodoListRepositoryImpl repository;

  setUp(() {
    remoteDataSource = MockTodoListRemoteDataSource();
    localDataSource = MockTodoListLocalDataSource();
    networkInfo = MockNetworkInfo();
    repository = TodoListRepositoryImpl(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
        networkInfo: networkInfo);
  });

  void runTestsOnline(VoidCallback body) {
    group('device is online', () {
      setUp(() {
        when(networkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runTestsOffline(VoidCallback body) {
    group('device is offline', () {
      setUp(() {
        when(networkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  group('ViewAllTasks', () {
    final List<TasksModel> tTodoListModel = [
      TasksModel(
          taskName: "Tests",
          description: "Test",
          dueDate: DateTime.now(),
          taskId: "taskId",
          completed: false)
    ];
    final List<Tasks> tTodoList = tTodoListModel;
    test('should check if device is online', () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);

      repository.viewAllTasks();
      verify(networkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'Should return remote data when the call to remote data is successful',
          () async {
        when(remoteDataSource.viewAllTasks())
            .thenAnswer((_) async => tTodoListModel);
        final result = await repository.viewAllTasks();
        verify(remoteDataSource.viewAllTasks());
        expect(result, equals(Right(tTodoList)));
      });

      test(
          'Should cache the data locally when the call to remote data is successful',
          () async {
        when(remoteDataSource.viewAllTasks())
            .thenAnswer((_) async => tTodoListModel);
        await repository.viewAllTasks();
        verify(remoteDataSource.viewAllTasks());
        verify(localDataSource.cacheCurrentTodoList(tTodoListModel));
      });

      test(
          'Should return server failure when the call to remote data is unsuccessful',
          () async {
        when(remoteDataSource.viewAllTasks()).thenThrow(ServerException());
        final result = await repository.viewAllTasks();
        verify(remoteDataSource.viewAllTasks());
        verifyZeroInteractions(localDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });
    runTestsOffline(() {
      test(
          'Should return last locally cached data when the cached data is present',
          () async {
        when(localDataSource.getAllTasks())
            .thenAnswer((_) async => tTodoListModel);
        final result = await repository.viewAllTasks();
        verifyZeroInteractions(remoteDataSource);
        verify(localDataSource.getAllTasks());
        expect(result, equals(Right(tTodoList)));
      });

      test('Should return CacheFailure when there is no cached data present',
          () async {
        when(localDataSource.getAllTasks()).thenThrow(CacheException());
        final result = await repository.viewAllTasks();
        verifyZeroInteractions(remoteDataSource);
        verify(localDataSource.getAllTasks());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });

  group('ViewSpecificTasks', () {
    final String taskId = "taskId";
    final TasksModel tTodoModel = TasksModel(
        taskName: "Tests",
        description: "Test",
        dueDate: DateTime.now(),
        taskId: taskId,
        completed: false);
    final Tasks tTodo = tTodoModel;
    test('should check if device is online', () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);

      repository.viewSpecificTask("");
      verify(networkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'Should return remote data when the call to remote data is successful',
          () async {
        when(remoteDataSource.viewSpecificTask(any))
            .thenAnswer((_) async => tTodoModel);
        final result = await repository.viewSpecificTask(taskId);
        verify(remoteDataSource.viewSpecificTask(any));
        expect(result, equals(Right(tTodo)));
      });

      test(
          'Should cache the data locally when the call to remote data is successful',
          () async {
        when(remoteDataSource.viewSpecificTask(any))
            .thenAnswer((_) async => tTodoModel);
        await repository.viewSpecificTask(taskId);
        verify(remoteDataSource.viewSpecificTask(any));
        verify(localDataSource.cacheCurrentTask(tTodoModel));
      });

      test(
          'Should return server failure when the call to remote data is unsuccessful',
          () async {
        when(remoteDataSource.viewSpecificTask(any))
            .thenThrow(ServerException());
        final result = await repository.viewSpecificTask(taskId);
        verify(remoteDataSource.viewSpecificTask(any));
        verifyZeroInteractions(localDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });
    runTestsOffline(() {
      test(
          'Should return last locally cached data when the cached data is present',
          () async {
        when(localDataSource.getSpecificTask(any))
            .thenAnswer((_) async => tTodoModel);
        final result = await repository.viewSpecificTask(taskId);
        verifyZeroInteractions(remoteDataSource);
        verify(localDataSource.getSpecificTask(taskId));
        expect(result, equals(Right(tTodo)));
      });

      test('Should return CacheFailure when there is no cached data present',
          () async {
        when(localDataSource.getSpecificTask(any)).thenThrow(CacheException());
        final result = await repository.viewSpecificTask(taskId);
        verifyZeroInteractions(remoteDataSource);
        verify(localDataSource.getSpecificTask(any));
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
