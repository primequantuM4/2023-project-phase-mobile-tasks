import 'package:flutter/material.dart';

void main() => runApp(NApp());

class NApp extends StatefulWidget {
  @override
  State<NApp> createState() => _NAppState();
}

class _NAppState extends State<NApp> {
  //get name and store in variable from user
  List<String> n = [];

  //for writing
  TextEditingController c = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Name converter and storer')),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: c,
                  decoration: InputDecoration(
                      labelText: 'Enter your name to register')),
              ElevatedButton(
                  onPressed: () {
                    n.add(c.text);
                    setState(() {
                      c.clear();
                    });
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
