import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.navigateTo, required this.text});
  final VoidCallback? navigateTo;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.all(35),
        child: SizedBox(
          width: 200,
          height: 35,
          child: ElevatedButton(
              onPressed: navigateTo, child: Text(text)),
        ));
  }
}