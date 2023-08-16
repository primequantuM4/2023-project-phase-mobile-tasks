import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo/core/error/exception.dart';
import 'package:todo/features/todo_list/data/data_sources/todo_list_remote_data_source.dart';
import 'package:todo/features/todo_list/data/models/tasks_model.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture.dart';
import 'todo_list_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  late TodoListRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = TodoListRemoteDataSourceImpl(client: mockHttpClient);
  });
  void clientHttpSetup(
      {required MockClient mockHttpClient,
      required int statusCode,
      required String responseString}) {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture(responseString), statusCode));
  }

  group('View all tasks', () {
    final jsonList = jsonDecode(fixture('view_all_tasks.json'));
    final List<TasksModel> tTodoListModel =
        jsonList.map<TasksModel>((json) => TasksModel.fromJson(json)).toList();
    test('Should perform A GET request on a URL', () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('view_all_tasks.json'), 200));
      dataSource.viewAllTasks();
      verify(mockHttpClient
          .get(Uri.parse('http://192.168.137.122:8080/todo-list')));
    });
    test('Should return List<TasksModel> when the response code is 200',
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('view_all_tasks.json'), 200));
      final result = await dataSource.viewAllTasks();
      expect(result, equals(tTodoListModel));
    });
    test('Should throw a ServerException when the response is an error',
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('view_all_tasks.json'), 404));
      expect(() => dataSource.viewAllTasks(), throwsA(isA<ServerException>()));
    });
  });

  group('View specific task', () {
    final json = jsonDecode(fixture('tasks.json'));
    final tTodoListModel = TasksModel.fromJson(json);
    final tTaskId = 'taskId';
    test('Should perform A GET request on a URL with an id endpoint', () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('tasks.json'), 200));
      dataSource.viewSpecificTask('taskId');
      verify(mockHttpClient
          .get(Uri.parse('http://192.168.137.122:8080/todo-list/$tTaskId')));
    });
    test('Should return List<TasksModel> when the response code is 200',
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('tasks.json'), 200));
      final result = await dataSource.viewSpecificTask('taskId');
      expect(result, equals(tTodoListModel));
    });
    test('Should throw a ServerException when the response is an error',
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('tasks.json'), 404));
      expect(() => dataSource.viewSpecificTask('taskId'),
          throwsA(isA<ServerException>()));
    });
  });
  group('Create Task', () {
    final createdTask = TasksModel(
        taskName: "Task",
        dueDate: DateTime.parse('2023-10-10'),
        description: "Test Task",
        taskId: "taskId",
        completed: false);
    test('Should perform a POST request on a URL', () async {
      when(mockHttpClient.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response(fixture('tasks.json'), 201));
      await dataSource.createTask(createdTask);
      verify(mockHttpClient.post(
          Uri.parse('http://192.168.137.122:8080/todo-list'),
          body: jsonEncode(createdTask.toJson())));
    });
    test('Should return a TasksModel when the reponse code is 201', () async {
      when(mockHttpClient.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response(fixture('tasks.json'), 201));
      final result = await dataSource.createTask(createdTask);
      expect(result, equals(createdTask));
    });
    test('Should return a ServerException when the response code is an error',
        () async {
      when(mockHttpClient.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response(fixture('tasks.json'), 201));
    });
  });
}
