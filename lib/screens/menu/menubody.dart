import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shadowtask/screens/home/body.dart';
import 'package:shadowtask/screens/support/supportbody.dart';

class menuhome extends StatelessWidget {
  const menuhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/backgroundMenu.jpeg"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Column(children: <Widget>[
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()))
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 90, left: 10),
                    child: Text(
                      "Home",
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 228, 228),
                          fontSize: 24),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 10),
                  child: Text(
                    "About",
                    style: TextStyle(
                        color: Color.fromARGB(255, 228, 228, 228),
                        fontSize: 24),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 10),
                  child: Text(
                    "Account",
                    style: TextStyle(
                        color: Color.fromARGB(255, 228, 228, 228),
                        fontSize: 24),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => supportpage()))
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 30, left: 10),
                    child: Text(
                      "Support",
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 228, 228),
                          fontSize: 24),
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
        Container()
      ]),
    );
  }
}
