import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/Model/Tasks.dart';

class TaskCard extends StatelessWidget {
  TaskCard({
    super.key,
    required this.tasks
  });
  final List<Color> color = [Colors.red, Colors.yellow, Colors.green];

  final Tasks tasks;
  Color getRandomColor() {
    int randomIndex = Random().nextInt(color.length);
    return color[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        width: 340,
        height: 100,
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
                    child: Text(tasks.taskName[0].toUpperCase()),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 100,
                  child: Wrap(children: [
                    Text(
                      tasks.taskName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
              ],
            ),
            Row(
              children: [
                Text(DateFormat("MMM dd, yyyy").format(tasks.dueDate)),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 5,
                  height: 60,
                  color: getRandomColor(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
