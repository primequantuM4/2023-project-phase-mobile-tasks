import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget {
  const CustomTextView(
      {super.key,
      required this.passedValue,
      required this.textHeader,
      this.height});

  final String passedValue;
  final String textHeader;
  final int? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textHeader,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          // color: const Color.fromARGB(255, 197, 196, 196),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 197, 196, 196),
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.all(5),
          width: 350,
          height: (height == null? 60 : height!.toDouble()),
          child: TextFormField(
            maxLines: null,
            enabled: false,
            initialValue: passedValue,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}