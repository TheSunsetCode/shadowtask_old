import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shadowtask/screens/home/home.dart';
import 'package:shadowtask/screens/login/login.dart';
import 'package:shadowtask/screens/support/supportbody.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class registerpage extends StatelessWidget {
  registerpage({Key? key}) : super(key: key);

  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var userId = "";
  String errorText = "";

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/taskdata.txt');
  }

  Future<String> getFilePath() async {
    Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory.path; // 2
    String filePath = '$appDocumentsPath/taskdata.txt'; // 3

    return filePath;
  }

  void saveFile() async {
    File file = File(await getFilePath()); // 1
    print(userId);
    file.writeAsString(userId); // 2
  }

  void WriteData() {
    Future<File> writeCounter(int counter) async {
      final file = await _localFile;

      // Write the file
      return file.writeAsString(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 100, top: 10),
                child: const Text(
                  "ShadowTask",
                  style: TextStyle(
                      fontSize: 40, color: Color.fromARGB(255, 228, 228, 228)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, top: 20),
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 40, color: Color.fromARGB(255, 228, 228, 228)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 23),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: "Email here"),
                  controller: emailController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 23),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: "Password here"),
                  controller: passwordController,
                ),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => login()))
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 27),
                  child: const Text(
                    "Already have a account? Login here!",
                    style: TextStyle(color: Color.fromARGB(255, 228, 228, 228)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: signUp,
                child: Container(
                  width: 130,
                  height: 55,
                  margin: const EdgeInsets.only(top: 30, left: 70),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      color: Colors.black),
                  child: const Center(
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
                  margin: const EdgeInsets.only(top: 27),
                  child: GestureDetector(
                    onTap: () => {launch('mailto:shadowtech011@gmail.com')},
                    child: const Text(
                      "Having problems? press here for support!",
                      style:
                          TextStyle(color: Color.fromARGB(255, 228, 228, 228)),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Future signUp() async {
    try {
      FirebaseFirestore.instance
                                  .collection("Tasks")
                                  .doc("user ${emailController.text}")
                                  .set({"data": "first data"});
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState() {
          errorText = "password is to weak";
        }
      } else if (e.code == 'email-already-in-use') {
        setState() {
          errorText = "user already in use";
        }
      }
    } catch (e) {
      setState() {
        errorText = "account created!";
      }

      print(emailController.text);
    }
  }
}
