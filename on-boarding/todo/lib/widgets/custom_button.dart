import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.navigateTo, required this.text});
  final VoidCallback? navigateTo;
  final String text;
  // final int borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.all(35),
        child: SizedBox(
          width: 200,
          height: 35,
          child: ElevatedButton(
              onPressed: this.navigateTo, child: Text(this.text)),
        ));
  }
}