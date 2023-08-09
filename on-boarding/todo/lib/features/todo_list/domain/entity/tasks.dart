import 'package:equatable/equatable.dart';

class Tasks extends Equatable {
  String taskName;
  DateTime dueDate;
  String description;
  String taskId;
  bool completed = false;

  Tasks(this.taskName, this.dueDate, this.description, this.taskId);

  @override
  List<Object> get props => [taskName, dueDate, description, taskId, completed];
}
