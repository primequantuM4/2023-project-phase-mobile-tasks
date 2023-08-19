import 'package:intl/intl.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';

class TasksModel extends Tasks {
  TasksModel(
      {required super.title,
      required super.dueDate,
      required super.description,
      required super.id,
      required super.status});

  factory TasksModel.fromJson(Map<String, dynamic> jsonMap) {
    final bool convertedStatus =
        jsonMap["status"] == "Completed" ? true : false;
    return TasksModel(
        title: jsonMap["title"],
        description: jsonMap["description"],
        dueDate: DateTime.parse(jsonMap["dueDate"]),
        id: jsonMap["id"],
        status: convertedStatus);
  }
  Map<String, dynamic> toJson() {
    final String curStats = status == false ? "In Progress" : "Completed";
    return {
      'title': title,
      'description': description,
      'dueDate': DateFormat('yyyy-MM-dd').format(dueDate),
      'id': id,
      'status': curStats
    };
  }
}
