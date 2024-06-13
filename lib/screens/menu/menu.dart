import 'package:flutter/material.dart';
import 'package:shadowtask/screens/menu/menubody.dart';

void main() {
  runApp(const menu());
}

class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  State<menu> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 228, 228, 228)),
        home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/backgroundMenu.jpeg"),
                  fit: BoxFit.cover)),
          child: menuhome(),
        ));
  }
}
