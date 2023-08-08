import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/domain/entity/tasks.dart';

class TaskCard extends StatelessWidget {
  TaskCard({
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
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Material(
                  elevation: 6,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Text(
                      tasks.taskName[0].toUpperCase(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Wrap(children: [
                        Text(
                          tasks.taskName,
                          style: TextStyle(
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
                        value: tasks.completed, onChanged: onChangedHandler)
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 5,
                  height: 60,
                  color: this.colorPick,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
