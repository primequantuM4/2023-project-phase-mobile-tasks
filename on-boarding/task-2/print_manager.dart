import 'dart:io';

import 'main.dart';
import 'task_manager.dart';
import 'tasks.dart';

class PrintManager {
  void deleteTask(TaskManager tm) {
    print("Please choose a task: (select a number for said task)");
    tm.printTask();
    print("Choose");
    int taskNumber = int.parse(stdin.readLineSync()!);
    tm.DeleteTask(taskNumber - 1);
  }

  void editTask(TaskManager tm) {
    print("Please choose a task: (select a number for said task)");
    tm.printTask();
    print("Choose");
    int taskNumber = int.parse(stdin.readLineSync()!);
    print("Please add the task information");
    print("-----------------------------------");
    print("Task Name: ");
    String? title = stdin.readLineSync();
    print("-----------------------------------");
    print("Task Description: ");
    String? description = stdin.readLineSync();
    print("-----------------------------------");
    print("Task time: (Use format YYYY-MM-DD hh:mm:ss)");
    print("Task Status");
    String? response = stdin.readLineSync();
    TaskStatus status = TaskStatus.Pending;
    while (response == null) {
      print("Please respond with either Completed or Pending");
    }
    if (response.toLowerCase() == "completed") {
      status = TaskStatus.Completed;
    }
    DateTime time = DateTime.parse(stdin.readLineSync()!);
    tm.EditTask(taskNumber - 1, title!, description!, status, time);
  }

  void addTask(TaskManager tm) {
    print("Please add the task information");
    print("-----------------------------------");
    print("Task Name: ");
    String? title = stdin.readLineSync();
    print("-----------------------------------");
    print("Task Description: ");
    String? description = stdin.readLineSync();
    print("-----------------------------------");
    print("Task time: (Use format YYYY-MM-DD hh:mm:ss)");
    DateTime time = DateTime.parse(stdin.readLineSync()!);
    print("-----------------------------------");
    tm.AddTask(title!, description!, time, TaskStatus.Pending);
  }
}
