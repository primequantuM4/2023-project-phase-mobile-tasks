
import 'package:flutter/material.dart';
import 'custom_button.dart';

class CustomWidgetBackgroundWithButton extends StatelessWidget {
  CustomWidgetBackgroundWithButton({super.key});
  final Widget _colorBackground = Container(
    height: double.infinity,
    width: double.infinity,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF917B), Color(0xFFEE6F57), Color(0xFFF65635)],
          stops: [0.2, 0.5, 0.9]),
    ),
  );
  final Image _backgroundImage = Image.asset(
    'images/stick-man-painting-on-canvas.png',
    fit: BoxFit.contain,
    width: double.infinity,
    height: double.infinity,
  );
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _colorBackground,
      _backgroundImage,
      CustomButton(
          navigateTo: () {
            Navigator.pushNamed(context, '/todo-list');
          },
          text: "Get Started")
    ]);
  }
}