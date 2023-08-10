import 'package:intl/intl.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';

class TasksModel extends Tasks {
  @override
  final String taskName;
  @override
  final String description;
  @override
  final DateTime dueDate;
  @override
  final String taskId;
  @override
  final bool completed;

  const TasksModel(
      {required this.taskName,
      required this.description,
      required this.dueDate,
      required this.taskId,
      required this.completed})
      : super(
            taskName: taskName,
            dueDate: dueDate,
            description: description,
            taskId: taskId,
            completed: completed);

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
