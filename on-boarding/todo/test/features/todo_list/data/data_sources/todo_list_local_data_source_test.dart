import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/error/exception.dart';
import 'package:todo/features/todo_list/data/data_sources/todo_list_local_data_source.dart';
import 'package:todo/features/todo_list/data/models/tasks_model.dart';

import '../../../../fixtures/fixture.dart';
import 'todo_list_local_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
void main() {
  late TodoListLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        TodoListLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });
  group('getAllTasks', () {
    final jsonList = jsonDecode(fixture('view_all_tasks.json'));
    final tTodoListModel = jsonList["data"]
        .map<TasksModel>((json) => TasksModel.fromJson(json))
        .toList();
    test(
        'Should return Tasks from SharedPreferences when there is one in the cache ',
        () async {
      when(mockSharedPreferences.getString(any))
          .thenReturn((fixture(('view_all_tasks.json'))));

      final result = await dataSource.getAllTasks();

      verify(mockSharedPreferences.getString(CACHED_TODO_LIST));
      expect(result, equals(tTodoListModel));
    });

    test('Should throw a CacheException when there is no cached value ',
        () async {
      when(mockSharedPreferences.getStringList(any)).thenReturn(null);

      expect(() => dataSource.getAllTasks(), throwsA(isA<CacheException>()));
    });
  });
  group('cacheCurrentTodoList', () {
    final tTodoListToCache = [
      TasksModel(
          title: "Task",
          dueDate: DateTime.parse('2023-10-10'),
          description: "Task test",
          id: "testId",
          status: false)
    ];
    test('Should call shared preferences to cache the data', () async {
      dataSource.cacheCurrentTodoList(tTodoListToCache);

      final expectedJsonList = jsonEncode(tTodoListToCache);
      verify(mockSharedPreferences.setString(
          CACHED_TODO_LIST, expectedJsonList));
    });
  });
}
