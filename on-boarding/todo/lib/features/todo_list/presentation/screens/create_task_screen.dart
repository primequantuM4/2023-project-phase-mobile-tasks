import 'package:flutter/material.dart';
import 'package:todo/features/todo_list/presentation/widgets/custom_appbar.dart';

import 'task_form.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(titleText: "Create new task",),
      body: TaskForm(),
    );
  }
}

