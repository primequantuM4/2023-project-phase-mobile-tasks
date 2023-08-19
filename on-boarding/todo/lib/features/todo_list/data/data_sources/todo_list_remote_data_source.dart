import 'dart:convert';

import 'package:todo/core/error/exception.dart';
import 'package:todo/features/todo_list/data/models/tasks_model.dart';
import 'package:http/http.dart' as http;

abstract class TodoListRemoteDataSource {
  Future<TasksModel> createTask(TasksModel tasks);
  Future<List<TasksModel>> viewAllTasks();
  Future<TasksModel> viewSpecificTask(String taskId);
}

class TodoListRemoteDataSourceImpl implements TodoListRemoteDataSource {
  final http.Client client;

  TodoListRemoteDataSourceImpl({required this.client});
  @override
  Future<TasksModel> createTask(TasksModel tasks) async {
    final createdTask = await client.post(
        Uri.parse('https://mock-todo-api-ib6b.onrender.com/api/v1/todo'),
        body: jsonEncode(tasks.toJson()));
    if (createdTask.statusCode == 201) {
      return tasks;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TasksModel>> viewAllTasks() async {
    final result =
        await client.get(Uri.parse('https://mock-todo-api-ib6b.onrender.com/api/v1/todo'));
    if (result.statusCode == 200) {
      final jsonResponse = jsonDecode(result.body);
      final List<TasksModel> tasksList = jsonResponse["data"]
          .map<TasksModel>((json) => TasksModel.fromJson(json))
          .toList();
      return tasksList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TasksModel> viewSpecificTask(String taskId) async {
    final result = await client
        .get(Uri.parse('https://mock-todo-api-ib6b.onrender.com/api/v1/todo/$taskId'));
    if (result.statusCode == 200) {
      final task = TasksModel.fromJson(jsonDecode(result.body)["data"]);
      return task;
    } else {
      throw ServerException();
    }
  }
}
