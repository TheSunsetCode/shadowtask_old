import 'package:flutter/material.dart';
import 'package:shadowtask/screens/support/supportbody.dart';

void main() {
  runApp(const support());
}

class support extends StatefulWidget {
  const support({Key? key}) : super(key: key);

  @override
  State<support> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<support> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 228, 228, 228)),
      home: supportpage(),
    );
  }
}
