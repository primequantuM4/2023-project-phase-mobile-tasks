
import 'package:flutter/material.dart';

class CountingStateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CounterState();
  }
}

class CounterState extends State<CountingStateScreen> {
  int _counter = 0;

  void increment() {
    setState(() {
      _counter = (_counter + 1) % 11;
    });
  }

  void decrement() {
    setState(() {
      _counter = (_counter - 1 + 11) % 11;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_counter.toString()),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: decrement, child: Text('Decrement')),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: increment, child: Text('Increment'))
              ],
            )
          ],
        ),
      ),
    );
  }
}