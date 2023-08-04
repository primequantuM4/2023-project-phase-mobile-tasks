import 'package:flutter/material.dart';
import 'package:todo/widgets/custom_appbar.dart';

import 'task_form.dart';

class CreateTaskScreen extends StatefulWidget {
  CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "Create new task",),
      body: TaskForm(),
    );
  }
}

