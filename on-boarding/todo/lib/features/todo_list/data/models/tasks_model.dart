import 'package:intl/intl.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';

class TasksModel extends Tasks {
  TasksModel(
      {required super.taskName,
      required super.dueDate,
      required super.description,
      required super.taskId,
      required super.completed});

  factory TasksModel.fromJson(Map<String, dynamic> jsonMap) {
    return TasksModel(
        taskName: jsonMap["taskName"],
        description: jsonMap["description"],
        dueDate: DateTime.parse(jsonMap["dueDate"]),
        taskId: jsonMap["taskId"],
        completed: jsonMap["completed"]);
  }
  Map<String, dynamic> toJson() {
    return {
      'taskName': taskName,
      'description': description,
      'dueDate': DateFormat('yyyy-MM-dd').format(dueDate),
      'taskId': taskId,
      'completed': completed
    };
  }
}
