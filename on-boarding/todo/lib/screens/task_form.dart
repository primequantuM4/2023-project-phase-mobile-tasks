import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/Model/Tasks.dart';

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

  final List<Tasks> taskList = [];

  void addTaskList() {
    bool everyThingFilled =
        taskName.text != "" && description.text != "" && dueDate.text != "";
    if (everyThingFilled) {
      Navigator.pop(context,
          Tasks(taskName.text, DateTime.parse(dueDate.text), description.text));
    } else {
      Navigator.pop(context);
    }
  }

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
            height: 45,
          ),
          SizedBox(
            height: 40,
          ),
          CustomFormField(
            taskName: "Due date",
            taskNameController: dueDate,
            icon: Icons.calendar_today,
            action: () async {
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100));
              setState(() {
                if (newDate != null)
                  dueDate.text = DateFormat('yyyy-MM-dd').format(newDate);
              });
            },
          ),
          SizedBox(
            height: 40,
          ),
          CustomFormField(
              height: 60,
              taskName: "Description",
              taskNameController: description),
          SizedBox(
            height: 40,
          ),
          Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: addTaskList,
                child: Text("Add a task"),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFEE6F57))),
              ))
        ],
      ),
    );
  }
}
