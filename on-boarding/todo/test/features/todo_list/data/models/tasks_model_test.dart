import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo/features/todo_list/data/models/tasks_model.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';

import '../../../../fixtures/fixture.dart';

void main() {
  final tTasksModel = TasksModel(
      title: "Task",
      description: "Test Task",
      dueDate: DateTime.parse('2023-10-10'),
      id: "testId",
      status: false);
  test('should be a sub-type of Tasks entity', () async {
    expect(tTasksModel, isA<Tasks>());
  });

  group('fromJson', () {
    test('Should output a valid Task Model', ()async {
      final Map<String, dynamic> jsonMap = await jsonDecode(fixture('tasks.json'))["data"];
      final result = TasksModel.fromJson(jsonMap);
      expect(result, equals(tTasksModel));
    });
  });
  group('toJson', () {
    test('Should return a JSON map containing the proper data', () {
      final result = tTasksModel.toJson();
      final expectedMap = {
        "title": "Task",
        "description": "Test Task",
        "dueDate": "2023-10-10",
        "id": "testId",
        "status": "In Progress"
      };
      expect(result, equals(expectedMap));
    });
  });
}
