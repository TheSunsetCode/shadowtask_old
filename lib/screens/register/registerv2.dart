library registerv2;

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shadowtask/screens/home/body.dart';
import 'package:shadowtask/screens/login/loginv2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class registerv2 extends StatefulWidget {
  const registerv2({Key? key}) : super(key: key);

  @override
  State<registerv2> createState() => _loginv2State();
}

// ignore: camel_case_types
class _loginv2State extends State<registerv2> {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static String errorText = '';

  @override
  Widget build(BuildContext context) {
    var screensizewidth = MediaQuery.of(context).padding;
    double screenSizeWith = MediaQuery.of(context).size.width;
    String screenwidthstr = screensizewidth.toString();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 228, 228, 228)),
      home: Scaffold(
        body: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 34),
                child: const Text(
                  "ShadowTask",
                  style: TextStyle(
                    color: Color.fromARGB(150, 0, 0, 0),
                    fontSize: 40,
                    shadows: [
                      Shadow(
                        offset: Offset(-2, 2),
                        color: Color.fromARGB(112, 158, 158, 158),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: screenSizeWith - 40,
                margin: EdgeInsets.only(top: 126),
                child: TextField(
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "Email"),
                  controller: emailController,
                ),
              ),
            ),
            Center(
              child: Container(
                width: screenSizeWith - 70,
                margin: EdgeInsets.only(top: 90),
                child: TextField(
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "Password"),
                  obscureText: true,
                  controller: passwordController,
                ),
              ),
            ),
            Container(
              child: Text(errorText, style: TextStyle(color: Colors.red)),
            ),
            Center(
              child: Container(
                // aqui
                width: MediaQuery.of(context).size.width - 70,
                height: 60,
                margin: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(120, 16, 196, 113),
                  )),
                  onPressed: signUp,
                  child: Container(
                      /*
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(150, 16, 196, 112),
                          Color.fromARGB(255, 16, 196, 112),
                        ],
                      )),
                      padding: const EdgeInsets.all(10.0),*/
                      child: Text(
                    "REGISTER",
                    style: TextStyle(fontSize: 32, color: Colors.grey[700]),
                  )),
                ),
              ),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Image(image: AssetImage("assets/images/google.png"), width: 42, height: 42,)),
            ),
            GestureDetector(
              onTap: (() => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => loginv2()))
                  }),
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    "Don’t have an account? Login here!",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
        persistentFooterButtons: [
          Row(
            children: [
              GestureDetector(
                onTap: (() => {
                      launch(
                          'https://www.instagram.com/tienda_shadowtech_software/')
                    }),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Image(image: AssetImage("assets/images/instagram.png"), width: 27, height: 27,)),
              ),
              GestureDetector(
                onTap: (() => {launch('http://www.theshadowtech.com/')}),
                child: Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(left: screenSizeWith - 82),
                    child: Image(image: AssetImage("assets/images/web.png"), width: 27, height: 27,)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //errorText = "The password provided is to weak";
        setState(() {
          errorText = "The password provided is to weak";
        });
      } else if (e.code == 'email-already-in-use') {
        //errorText = "The account already exists for that email";
        setState(() {
          errorText = "The account already exists";
        });
      }
    }
  }
}
