
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.taskName,
      required this.taskNameController,
      this.icon,
      this.action});

  final TextEditingController taskNameController;
  final String taskName;
  final IconData? icon;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 50),
        child: Text(
          taskName,
          style: TextStyle(
              color: Color(0xFFEE6F57),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Container(
        // alignment: Alignment.centerLeft,
        height: 40,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            maxLines: null,
            autocorrect: true,
            controller: taskNameController,
            keyboardType: TextInputType.name,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(icon),
                  color: Color(0xFFEE6F57),
                ),
                contentPadding: EdgeInsets.only(top: 7, left: 10)),
          ),
        ),
      ),
    ]);
  }
}