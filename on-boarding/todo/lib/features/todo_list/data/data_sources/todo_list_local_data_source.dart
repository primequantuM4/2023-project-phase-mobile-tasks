import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/error/exception.dart';

import '../models/tasks_model.dart';

abstract class TodoListLocalDataSource {
  Future<void> cacheCurrentTodoList(List<TasksModel> todoListToCache);
  Future<List<TasksModel>> getAllTasks();
}

const CACHED_TODO_LIST = 'CACHED_TODO_LIST';

class TodoListLocalDataSourceImpl implements TodoListLocalDataSource {
  final SharedPreferences sharedPreferences;

  TodoListLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheCurrentTodoList(List<TasksModel> todoListToCache) {
    final jsonList = jsonEncode(todoListToCache);
    return sharedPreferences.setString(CACHED_TODO_LIST, jsonList);
  }

  @override
  Future<List<TasksModel>> getAllTasks() async {
    final jsonValues = await sharedPreferences.getString(CACHED_TODO_LIST);
    if (jsonValues != null) {
      final Map<String, dynamic> jsonList = jsonDecode(jsonValues);
      final List<TasksModel> convertedList = jsonList["data"]
          .map<TasksModel>((json) => TasksModel.fromJson(json))
          .toList();
      return Future.value(convertedList);
    } else {
      throw CacheException();
    }
  }
}
