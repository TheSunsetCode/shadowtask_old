import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class supportpage extends StatelessWidget {
  const supportpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 70, left: 90),
            width: MediaQuery.of(context).size.width -200,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Email here",
                border: InputBorder.none
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 90),
            width: MediaQuery.of(context).size.width -200,
            height: 1,
            color: Colors.grey[900],
          ),
          Container(
            margin: EdgeInsets.only(top: 70, left: 90),
            width: MediaQuery.of(context).size.width -200,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Name here",
                border: InputBorder.none
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 90),
            width: MediaQuery.of(context).size.width -200,
            height: 1,
            color: Colors.grey[900],
          ),
        ],
      ),
    );
  }
}
