class Tasks {
  String title;
  String description;
  DateTime time;
  TaskStatus taskStatus;

  Tasks(this.title, this.description, this.time, this.taskStatus);
}

enum TaskStatus { Completed, Pending }

