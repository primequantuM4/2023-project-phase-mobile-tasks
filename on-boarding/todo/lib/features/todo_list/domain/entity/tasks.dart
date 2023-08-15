import 'package:equatable/equatable.dart';

class Tasks extends Equatable {
  final String taskName;
  final DateTime dueDate;
  final String description;
  final String taskId;
  final bool completed;

  Tasks(
      {required this.taskName,
      required this.dueDate,
      required this.description,
      required this.taskId,
      required this.completed});

  Tasks copyWith(
      {String? taskName,
      DateTime? dueDate,
      String? description,
      String? taskId,
      bool? completed}) {
    return Tasks(
        taskName: taskName ?? this.taskName,
        dueDate: dueDate ?? this.dueDate,
        description: description ?? this.description,
        taskId: taskId ?? this.taskId,
        completed: completed ?? this.completed);
  }

  @override
  List<Object?> get props =>
      [taskName, dueDate, description, taskId, completed];
}
