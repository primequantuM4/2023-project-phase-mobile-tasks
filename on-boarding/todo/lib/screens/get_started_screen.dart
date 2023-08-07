import 'package:flutter/material.dart';
import 'package:todo/widgets/custom_widget_background_with_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomWidgetBackgroundWithButton());
  }
}
