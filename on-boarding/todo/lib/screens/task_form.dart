
import 'package:flutter/material.dart';

import '../widgets/custom_form_field.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() {
    return TaskFormState();
  }
}

class TaskFormState extends State<TaskForm> {
  final TextEditingController taskName = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController dueDate = TextEditingController();

  final ElevatedButton _button = ElevatedButton(
    onPressed: () {},
    child: Text("Add a task"),
    style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        backgroundColor: MaterialStateProperty.all(Color(0xFFEE6F57))),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          CustomFormField(
            taskNameController: taskName,
            taskName: "Main task name",
          ),
          SizedBox(
            height: 40,
          ),
          CustomFormField(
            taskName: "Due date",
            taskNameController: dueDate,
            icon: Icons.calendar_today,
          ),
          SizedBox(
            height: 40,
          ),
          CustomFormField(
              taskName: "Description", taskNameController: description),
          SizedBox(
            height: 40,
          ), 
          Container(alignment:Alignment.center, child: _button)
        ],
      ),
    );
  }
}
