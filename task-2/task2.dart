import 'dart:io';

void main(List<String> args) {
  TaskManager tm = new TaskManager([]);
  bool quit = false;

  while (!quit) {
    print('What do you want to do:');
    print(
        "Add a task, Edit a Task, Delete a task, View all Tasks, View completed tasks, View pending tasks, quit");
    String? response = stdin.readLineSync();
    while (response == null) {
      print("Invalid task please choose a correct Task");
      response = stdin.readLineSync();
      print("-----------------------------------");
    }
    if (response.toLowerCase() == "add a task") {
      addTask(tm);
    } else if (response.toLowerCase() == "edit a task") {
      editTask(tm);
    } else if (response.toLowerCase() == "delete a task") {
      deleteTask(tm);
    } else if (response.toLowerCase() == "view completed tasks") {
      tm.viewCompletedTasks();
    } else if (response.toLowerCase() == "view all tasks") {
      tm.viewAllTasks();
    } else if (response.toLowerCase() == "view pending tasks") {
      tm.viewPendingTasks();
    } else if (response.toLowerCase() == "quit") {
      print("--------quiting-------------");
      quit = true;
    } else {
      print("Command doesn't exist please try again");
    }
  }
}

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

void getTasks(String typeVal) {}

class Tasks {
  String title;
  String description;
  DateTime time;
  TaskStatus taskStatus;

  Tasks(this.title, this.description, this.time, this.taskStatus);
}

enum TaskStatus { Completed, Pending }

class TaskManager {
  List<Tasks> taskList;

  TaskManager(this.taskList);
  void AddTask(
      String title, String description, DateTime time, TaskStatus taskStatus) {
    taskList.add(Tasks(title, description, time, taskStatus));
    print("Task successfully added");
  }

  void viewAllTasks() {
    print('----------------------------------------------------');
    if (taskList.isEmpty) {
      print("No tasks to show yet");
      print('----------------------------------------------------');
      return;
    }
    for (Tasks task in taskList) {
      print('----------------------------------------------------');
      print("Title: ${task.title}");
      print("Task Description: ${task.description}");
      print("Task is due: ${task.time.toString()}");

      if (task.taskStatus == TaskStatus.Completed) {
        print("Task status: Completed");
      } else {
        print("Task status: Pending");
      }
      print("-------------------------------------------------");
    }
  }

  void viewCompletedTasks() {
    print("-----------------------------------------------------");
    if (taskList.isEmpty) {
      print("No completed tasks yet");
      print('----------------------------------------------------');
      return;
    }
    for (Tasks task in taskList) {
      if (task.taskStatus == TaskStatus.Completed) {
        print("Title: ${task.title}");
        print("Task Description: ${task.description}");
        print("Task is due: ${task.time.toString()}");
        print("-------------------------------------------------");
      }
    }
  }

  void viewPendingTasks() {
    print("------------------------------------------------------");
    if (taskList.isEmpty) {
      print("No pending tasks yet");
      print('----------------------------------------------------');
      return;
    }
    for (Tasks task in taskList) {
      if (task.taskStatus == TaskStatus.Pending) {
        print("Title: ${task.title}");
        print("Task Description: ${task.description}");
        print("Task is due: ${task.time.toString()}");
        print("-------------------------------------------------");
      }
    }
  }

  void EditTask(int index, String title, String description, TaskStatus status,
      DateTime time) {
    taskList[index].description = description;
    taskList[index].taskStatus = status;
    taskList[index].title = title;
    taskList[index].time = time;

    print("Task ${index + 1} edited succesfully");
  }

  void DeleteTask(int index) {
    taskList.removeAt(index);
    print("Task successfully deleted");
  }

  void printTask() {
    for (int i = 0; i < taskList.length; i++) {
      print("${i + 1}. ${taskList[i].title}");
    }
  }
}