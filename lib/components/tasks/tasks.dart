import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

void task() {
  runApp(Tasks());
}

class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 0),
        width: 200,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Color.fromARGB(105, 0, 0, 0),
        ),
        child: Material(
          elevation: 6,
        ),
      )
    ]));
  }
}
