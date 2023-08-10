import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget {
  const CustomTextView(
      {super.key,
      required this.passedValue,
      required this.textHeader,
      this.buttonVal,
      this.height});

  final String passedValue;
  final String textHeader;
  final int? height;
  final TextButton? buttonVal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textHeader,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 197, 196, 196),
              borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.all(5),
          width: 350,
          height: (height == null ? 60 : height!.toDouble()),
          child: TextFormField(
            maxLines: null,
            enabled: false,
            initialValue: passedValue,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
        if(buttonVal != null) buttonVal!
      ],
    );
  }
}
