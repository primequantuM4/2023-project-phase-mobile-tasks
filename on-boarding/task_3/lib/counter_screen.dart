import 'package:flutter/material.dart';
import 'counter_screen_state.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: CountingStateScreen(),
      ),
    );
  }
}