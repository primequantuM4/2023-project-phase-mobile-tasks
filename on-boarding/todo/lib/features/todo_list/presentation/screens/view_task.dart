import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';
import 'package:todo/features/todo_list/presentation/widgets/custom_appbar.dart';
import 'package:todo/features/todo_list/presentation/widgets/custom_text_view.dart';

class ViewTask extends StatefulWidget {
  final Tasks tasks;
  const ViewTask({super.key, required this.tasks});

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  late DateTime dueDateText;

  void changeDate() async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: dueDateText,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (newDate != null) {
      setState(() {
        dueDateText = newDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    dueDateText = widget.tasks.dueDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: "Task Detail",
          onLeadingPressed: () {
            context.pop(dueDateText);
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'images/motivated-girl.png',
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextView(
              passedValue: widget.tasks.taskName,
              textHeader: "Title",
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextView(
              passedValue: widget.tasks.description,
              textHeader: "Description",
              height: 100,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextView(
              key: ValueKey(dueDateText),
              passedValue: DateFormat('MMM dd, yyyy').format(dueDateText),
              textHeader: "Due date",
              buttonVal: TextButton(
                  onPressed: changeDate, child: const Text('Extend deadline')),
            )
          ],
        ),
      ),
    );
  }
}
