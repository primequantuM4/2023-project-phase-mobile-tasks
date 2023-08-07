import 'package:flutter/material.dart';
import 'package:todo/Model/Tasks.dart';
import 'package:todo/screens/create_task_screen.dart';
import 'package:todo/screens/view_task.dart';
import 'package:todo/widgets/custom_appbar.dart';
import 'package:todo/widgets/task_card.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  void _navigateToNextScreen(BuildContext context) async {
    final Tasks? result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => CreateTaskScreen()));
    if (result != null) {
      setState(() {
        taskCardInfo.add(result);
      });
    }
  }

  List<Tasks> taskCardInfo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "Todo List"),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'images/stickman-with-todo-list.png',
              width: 200,
              height: 200,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(10),
            child: Text(
              "Tasks list",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: ListView(
              shrinkWrap: true,
              children: taskCardInfo.map((element) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewTask(tasks: element)));
                    },
                    child: TaskCard(tasks: element));
              }).toList(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFEE6F57))),
                  onPressed: () {
                    _navigateToNextScreen(context);
                  },
                  child: Text("Create Task")))
        ],
      ),
    );
  }
}
