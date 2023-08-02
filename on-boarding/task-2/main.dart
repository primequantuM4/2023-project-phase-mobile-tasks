import 'dart:io';

import 'print_manager.dart';
import 'task_manager.dart';
import 'tasks.dart';

void main(List<String> args) {
  TaskManager tm = new TaskManager([]);
  PrintManager pm = PrintManager();
  bool quit = false;

  while (!quit) {
    print('What do you want to do:');
    print("-------------------------------------");
    print("1. Add a task");
    print("2. Edit a task");
    print("3. Delete a task");
    print("4. View all tasks");
    print("5. View completed tasks");
    print("6. View pending tasks");
    print("Press any other key to exit");
    String response = stdin.readLineSync()!;
    if (response.toLowerCase() == "1") {
      pm.addTask(tm);
    } else if (response.toLowerCase() == "2") {
      pm.editTask(tm);
    } else if (response.toLowerCase() == "3") {
      pm.deleteTask(tm);
    } else if (response.toLowerCase() == "4") {
      tm.viewAllTasks();
    } else if (response.toLowerCase() == "5") {
      tm.viewCompletedTasks();
    } else if (response.toLowerCase() == "6") {
      tm.viewPendingTasks();
    } else {
      print("--------quiting-------------");
      quit = true;
    }
  }
}


 
