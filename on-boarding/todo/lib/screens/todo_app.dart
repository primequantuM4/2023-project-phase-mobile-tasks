import 'package:flutter/material.dart';
import 'package:todo/Model/Tasks.dart';
import 'package:todo/screens/create_task_screen.dart';
import 'package:todo/screens/todo_list_screen.dart';
import 'package:todo/screens/view_task.dart';

import 'get_started_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  Widget viewTaskRouteBuilder(BuildContext context) {
    final tasks = ModalRoute.of(context)!.settings.arguments as Tasks;
    return ViewTask(tasks: tasks);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
              bodyLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
            actionsIconTheme: IconThemeData(color: Colors.black),
          )),
      title: "A2SV Tasks",
      initialRoute: '/',
      routes: {
        '/': (context) => const GetStartedScreen(),
        '/todo-list': (context) => TodoListScreen(),
        '/create-task': (context) => CreateTaskScreen(),
        '/view-task': (context) => viewTaskRouteBuilder(context)
      },
    );
  }
}
