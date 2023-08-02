import 'tasks.dart';

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
