import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shadowtask/components/tasks/datasaver.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shadowtask/screens/home/body.dart';
import 'package:shadowtask/screens/register/registerBody.dart';
import 'package:shadowtask/screens/register/registerv2.dart';

class TaskCreator extends StatelessWidget {
  TaskCreator({Key? key}) : super(key: key);
  String inputTask = "";
  String UIDdata = registerpage().userId.toString();
  String InputData = Input.input.toString();
  int Inode = 1;
  bool taskcreation = logic.isTaskCreated;

  @override
  Widget build(BuildContext context) {
    Inode++;
    taskcreation = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            // Demo
            Container(
              margin: EdgeInsets.only(top: 5),
              width: MediaQuery.of(context).size.width - 20,
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromARGB(228, 228, 228, 228),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    child: GetUserName('data $Inode'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('MyTodos');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("${data['taskData']}");
        }

        return Text("loading");
      },
    );
  }
}
