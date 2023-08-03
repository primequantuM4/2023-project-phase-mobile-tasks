
import 'package:flutter/material.dart';

import 'get_started_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

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
      home: Scaffold(
        body: GetStartedScreen(),
      ),
    );
  }
}