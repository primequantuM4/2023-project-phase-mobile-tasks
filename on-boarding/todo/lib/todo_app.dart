import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';
import 'package:todo/features/todo_list/presentation/bloc/todo_list_bloc.dart';
import 'package:todo/features/todo_list/presentation/screens/create_task_screen.dart';
import 'package:todo/features/todo_list/presentation/screens/todo_list_screen.dart';
import 'package:todo/features/todo_list/presentation/screens/view_task.dart';

import 'features/todo_list/presentation/screens/get_started_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  Widget viewTaskRouteBuilder(BuildContext context) {
    final tasks = ModalRoute.of(context)!.settings.arguments as Tasks;
    return ViewTask(tasks: tasks);
  }

  @override
  Widget build(BuildContext context) {
    final GoRouter router =
        GoRouter(navigatorKey: GlobalKey<NavigatorState>(), routes: [
      GoRoute(path: '/', builder: (context, state) => const GetStartedScreen()),
      GoRoute(
          path: '/todo-list', builder: (context, state) => const TodoListScreen()),
      GoRoute(
          path: '/create-task',
          builder: (context, state) => const CreateTaskScreen()),
      GoRoute(
          path: '/view-task',
          builder: (context, GoRouterState state) =>
              ViewTask(tasks: state.extra! as Tasks))
    ]);
    return MaterialApp(
      // home: BlocProvider(
      //   create: (context) => TodoListBloc(),
        home: MaterialApp.router(
          routerConfig: router,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          appBarTheme: const AppBarTheme(
            actionsIconTheme: IconThemeData(color: Colors.black),
          )),
      title: "A2SV Tasks",
    );
  }
}
