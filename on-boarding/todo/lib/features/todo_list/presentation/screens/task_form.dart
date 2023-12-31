import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';

import '../widgets/custom_form_field.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() {
    return TaskFormState();
  }
}

class TaskFormState extends State<TaskForm> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController dueDate = TextEditingController();

  final List<Tasks> taskList = [];

  void addTaskList() {
    bool everyThingFilled =
        title.text != "" && description.text != "" && dueDate.text != "";
    if (everyThingFilled) {
      final newTask = {
        "title": title.text,
        "description": description.text,
        "dueDate": dueDate.text
      };
      context.pop(newTask);
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          CustomFormField(
            titleController: title,
            title: "Main task name",
            height: 45,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomFormField(
            title: "Due date",
            titleController: dueDate,
            icon: Icons.calendar_today,
            inputType: TextInputType.datetime,
            action: () async {
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100));
              setState(() {
                if (newDate != null) {
                  dueDate.text = DateFormat('yyyy-MM-dd').format(newDate);
                }
              });
            },
          ),
          const SizedBox(
            height: 40,
          ),
          CustomFormField(
              height: 60,
              title: "Description",
              titleController: description),
          const SizedBox(
            height: 40,
          ),
          Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: addTaskList,
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFEE6F57))),
                child: const Text("Add a task"),
              ))
        ],
      ),
    );
  }
}
