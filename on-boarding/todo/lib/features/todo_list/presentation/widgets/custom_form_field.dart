import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.taskName,
      required this.taskNameController,
      this.icon,
      this.action,
      this.height
      });

  final TextEditingController taskNameController;
  final String taskName;
  final IconData? icon;
  final VoidCallback? action;
  final int? height;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 50),
        child: Text(
          taskName,
          style: const TextStyle(
              color: Color(0xFFEE6F57),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Container(
        height: (height == null ? 40 : height!.toDouble()),
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
            keyboardType: TextInputType.multiline,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: action,
                  icon: Icon(icon),
                  color: const Color(0xFFEE6F57),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 12)),
          ),
        ),
      ),
    ]);
  }
}
