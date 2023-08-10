import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/platform/network_info.dart';
import 'package:todo/features/todo_list/data/data_sources/todo_list_local_data_source.dart';
import 'package:todo/features/todo_list/data/data_sources/todo_list_remote_data_source.dart';
import 'package:todo/features/todo_list/data/repositories/todo_list_repository_impl.dart';

import 'todo_list_repositroy_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<TodoListRemoteDataSource>(),
  MockSpec<TodoListLocalDataSource>(),
  MockSpec<NetworkInfo>()
])
void main() {
  MockTodoListRemoteDataSource remoteDataSource;
  MockTodoListLocalDataSource localDataSource;
  MockNetworkInfo networkInfo;
  TodoListRepositoryImpl repository;

  setUp(() {
    remoteDataSource = MockTodoListRemoteDataSource();
    localDataSource = MockTodoListLocalDataSource();
    networkInfo = MockNetworkInfo();
    repository = TodoListRepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: localDataSource, networkInfo: networkInfo);
  });
}
