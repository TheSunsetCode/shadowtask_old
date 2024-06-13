import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shadowtask/screens/register/register.dart';
import 'package:shadowtask/screens/support/supportbody.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 100, top: 10),
                  child: Text(
                    "ShadowTask",
                    style: TextStyle(
                        fontSize: 40,
                        color: Color.fromARGB(255, 228, 228, 228)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 40,
                        color: Color.fromARGB(255, 228, 228, 228)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 23),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Email here"),
                    controller: emailController,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 23),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Password here"),
                    controller: passwordController,
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => register()))
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 27),
                    child: Text(
                      "Don't have a account? Register here",
                      style:
                          TextStyle(color: Color.fromARGB(255, 228, 228, 228)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: signUp,
                  child: Container(
                    width: 130,
                    height: 55,
                    margin: EdgeInsets.only(top: 30, left: 70),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        color: Colors.black),
                    child: Center(
                      child: Text(
                        "Accept",
                        style: TextStyle(
                            color: Color.fromARGB(255, 228, 228, 228),
                            fontSize: 25),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 27),
                    child: GestureDetector(
                      onTap: () => {launch('mailto:shadowtech011@gmail.com')},
                      child: Text(
                        "Having problems? press here for support!",
                        style: TextStyle(
                            color: Color.fromARGB(255, 228, 228, 228)),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Future signUp() async {
    try {
      FirebaseFirestore.instance
          .collection("Tasks")
          .doc("data ${emailController.text}")
          .set({"email": emailController.text});
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("user mot found");
      } else if (e.code == 'wrong-password') {
        print("incorrect password");
      }
    }
  }
}
