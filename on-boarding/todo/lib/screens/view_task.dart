import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/Model/Tasks.dart';
import 'package:todo/widgets/custom_appbar.dart';
import 'package:todo/widgets/custom_text_view.dart';

class ViewTask extends StatelessWidget {
  final Tasks tasks;
  ViewTask({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(titleText: "Task Detail"),
        body: Column(
          children: [
            Image.asset(
              'images/motivated-girl.png',
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextView(passedValue: tasks.taskName, textHeader: "Title",),
            SizedBox(
              height: 15,
            ),
            CustomTextView(passedValue: tasks.description, textHeader: "Description", height: 100,),
            SizedBox(
              height: 15,
            ),
            CustomTextView(passedValue: DateFormat("MMM dd, yyyy").format(tasks.dueDate), textHeader: "Due date")
          ],
        ),
      );
  }
}

