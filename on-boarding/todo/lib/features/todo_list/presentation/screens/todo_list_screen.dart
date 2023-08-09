import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/features/todo_list/domain/use_case/task_use_case.dart';
import 'package:todo/features/todo_list/presentation/widgets/custom_appbar.dart';
import 'package:todo/features/todo_list/presentation/widgets/task_card.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  TaskUseCase _taskUseCase = TaskUseCase([]);
  final Map<bool, Color> colorMapping = {
    false: Colors.red,
    true: Colors.green,
  };
  void _navigateToNextScreen(BuildContext context) async {
    final Map<String, String>? result =
        await context.push<Map<String, String>?>('/create-task');
    if (result != null) {
      setState(() {
        _taskUseCase.createTask(
            result["taskName"] as String,
            result["description"] as String,
            DateTime.parse(result["dueDate"] as String));
      });
    }
  }

  void markTask(element) {
    setState(() {
      _taskUseCase.completeTask(element.taskId);
    });
  }

  void editTaskDeadline(element) async {
    DateTime? result = await context.push('/view-task', extra: element);
    setState(() {
      element.dueDate = result!;
    });
  }

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
              children: _taskUseCase.viewAllTasks().map((element) {
                return InkWell(
                    onTap: () {
                      editTaskDeadline(element);
                    },
                    child: TaskCard(
                      key: ValueKey(element.dueDate),
                      tasks: element,
                      onComplete: () {
                        markTask(element);
                      },
                      colorPick: colorMapping[element.completed]!,
                    ));
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
