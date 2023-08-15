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
    final List<String> jsonList = [];

    for (var i in todoListToCache) jsonList.add(jsonEncode(i.toJson()));
    return sharedPreferences.setStringList(CACHED_TODO_LIST, jsonList);
  
  }

  @override
  Future<List<TasksModel>> getAllTasks() {
    final jsonValues = sharedPreferences.getStringList(CACHED_TODO_LIST);
    if (jsonValues != null) {
      final List<TasksModel> convertedList = [];
      for (var i in jsonValues) {
        convertedList.add(TasksModel.fromJson(jsonDecode(i)));
      }
      return Future.value(convertedList);
    } else {
      throw CacheException();
    }
  }
}
