import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/features/todo_list/domain/entity/tasks.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.tasks,
    required this.onComplete,
    required this.colorPick,
  });
  final VoidCallback onComplete;
  final Color colorPick;
  void onChangedHandler(bool? newValue) {
    onComplete();
  }

  final Tasks tasks;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Material(
                  elevation: 6,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Text(
                      tasks.title[0].toUpperCase(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Wrap(children: [
                        Text(
                          tasks.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(DateFormat("MMM dd, yyyy").format(tasks.dueDate)),
                    Checkbox(
                        value: tasks.status, onChanged: onChangedHandler)
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 5,
                  height: 60,
                  color: colorPick,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
