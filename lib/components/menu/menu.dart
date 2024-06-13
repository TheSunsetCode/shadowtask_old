import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width - 250,
          height: MediaQuery.of(context).size.height - 400,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 228, 228, 228).withOpacity(0.3),
              borderRadius:
                  BorderRadius.horizontal(left: Radius.circular(24.0))),
        )
      ],
    ));
  }
}
