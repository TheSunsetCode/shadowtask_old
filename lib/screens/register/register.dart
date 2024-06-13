import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shadowtask/firebase_options.dart';
import 'package:shadowtask/screens/home/body.dart';
import 'package:shadowtask/screens/register/registerBody.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      register();
    } else {
      HomePage();
    }
  });
  runApp(register());
}

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[900]),
      home: Container(
        child: registerpage(),
      ),
    );
  }
}
