// Made by @Vigo Walker && @Alexandre Portner!

// ignore_for_file: avoid_unnecessary_containers, sort_child_properties_last

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shadowtask/components/menu/menu.dart';
import 'package:shadowtask/components/tasks/tasks.dart';
import 'package:shadowtask/components/tasks/tasksCreator.dart';
import 'package:shadowtask/screens/home/home.dart';
import 'package:shadowtask/screens/login/loginv2.dart';
import 'package:shadowtask/screens/menu/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shadowtask/firebase_options.dart';
import 'package:shadowtask/screens/register/register.dart';
import 'package:shadowtask/screens/register/registerBody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shadowtask/screens/register/registerv2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shadowtask/components/tasks/plottasks.dart';

class userDataMainOne {
  static var userData = User;
}

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // all of this is to authenticate the user and not hav the need to log in!
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirebaseAuth.instance.authStateChanges().listen((User? user) {});

  runApp(HomePage());
}

bool istheTaskGoodToApear =
    true; // this is really important, it makes the tasks apear if there is data to be shown

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _MyWidgetState();
}

List<HomePage> takss = []; // no sirve

class Todo {
  // I can't stress more on how important this is! is part of the Tasks creater!
  final String title;

  const Todo(this.title);
}

class Input {
  static String input = ""; // This is what makes the tasks have data.
}

// ignore: camel_case_types
class logic {
  static bool isTaskCreated = false; // ni se que hace de tan inservible que es.
}

bool istheTaskGoodToGo = false; // detects if the tasks can be good to appear.

bool isthetaskgoingtobeReapeted = false;

bool isGoodToGo = false; // same as bellow
double Inode = 15; // I just don't know, but I prefer to keep it!

// ignore: camel_case_types
enum choice { verdadero, falso }

final todos = List.generate(20, (i) => Todo("TestTaks")); // testing for tasks
final dateOne =
    List.generate(20, (i) => Todo("TestTasks")); // IMPORTANT: don't remove!

class _MyWidgetState extends State<HomePage> {
  choice? elecciones = choice.falso; // all the variables of the code.
  List<String> todos = [];
  List<String> tasks = [];
  List tasktododatalist = [];
  bool isTaskCreated = logic.isTaskCreated;
  bool isEnded = false;
  int InodeTasks = -1000;
  int InodetaskPos = -1000;
  double IMarginPosTask = 15;
  List dateOne = [];
  String input = Input.input.toString();
  DateTime dateTwo = DateTime.now();
  int TaskNum = 1;
  List<String> Inp = [];
  List<String> taskposdesicder = [];
  DateTime selectedDate = DateTime.now();
  final UserDataLogin = emailpasswordData.emailController.text;
  final UserDataLoginpwd = emailpasswordData.passwordController.text;
  final userData = User;
  final UserMail = registerpage.emailController.text;
  bool FbHasdata = false;
  String dataI = "data";
  int dataInode = 1;
  var FireCurentUser = FirebaseAuth.instance.currentUser;
  List TaskNameDecider = [];
  List allData = [];
  String dataGetFromTasksTT = "";
  var DataSS;
  var DataIDTasks;
  List<Map<String, dynamic>> readdata = [];
  List<String> Items = [];
  var DataDataDataOne = "";
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isTaskGoingToBeReapeted = false;
  DateTime timer = DateTime.now();
  int itemslenght = 0;
  var ItemData = "";
  bool datagoodtogo = false;
  var printed = false;
  Queue que1 = Queue();
  bool isTheTaskNeededToBeReapeted = true;
  String WhatIstheTaskGoingToDo = "";
  double HowMuchTimeWillItBeNotified = 0;
  String doTime = "";
  bool isTheTaskCreationgoodToGo = false;
  // para el datasaver

  void initState() {
    // in this part, you should put all the functions and classes! or even variables!
    // TODO: implement initState
    super.initState();
    String input;
    // WaitForDataToApear();
  }

  CollectionReference _collectionRef = FirebaseFirestore.instance
      .collection('Tasks'); // is the Firebase main collection.

  createTodos() {
    //demo for creating Tasks
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('MyTodos').doc(input);
    Map<String, String> todos = {"todoTitle": input};
    documentReference.set(todos).whenComplete(() => {print("$input created")});
  }

  void TaskPosDecider() {
    // it decides where the tasks are gona be!
    while (isTaskCreated == true) {
      print(InodeTasks);
      taskposdesicder.add(InodeTasks.toString());
      break;
    }
  }

  var tsks = (() => {
        // does nothing for now, remove in production!
        Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: 0),
            width: 200,
            height: 45,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.black,
            ),
            child: const Material(
              elevation: 1,
            ),
          ),
        )
      });

  Future FlutterAuthOne() async {
    // it detects if the user is not signed in.
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => registerv2()));
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    // its for selecting the date in the Date picker.
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2022, 6),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  // its for the data to be detected!
  CollectionReference users = FirebaseFirestore.instance.collection('testuser');
  var dtone = FirebaseFirestore.instance.collection("TaskData 2").get();

  // creador de tasks / save data
  String? _content;
  String DataValue = "";
  _MyWidgetState({this.input = ""}); // importante
  callBack(varDataTasks) {
    setState(() {
      input = varDataTasks;
    });
  }
  // data saver
  // String DataSaver = '{"TaskData" : {"TaskTitle" : "' + input + '"}}';

  // Find the Documents path

  int Inode =
      1; // DO NOT REMOVE: its important to keep this, is a variable for for loops!

  // all of this is for checking if the data exists!
  Widget build(BuildContext context) {
    CollectionReference TaskDATA =
        FirebaseFirestore.instance.collection("TaskData 2");
    double screenSizeWith = MediaQuery.of(context).size.width;
    FlutterAuthOne();

    Future<bool> checkIfDocExists(String docId) async {
      bool docExists = await checkIfDocExists('data ${FireCurentUser!.email}');
      try {
        // Get reference to Firestore collection
        var collectionRef = FirebaseFirestore.instance.collection('Tasks');

        var doc = await collectionRef.doc(docId).get();
        return doc.exists;
      } catch (e) {
        throw e;
      }
    }

    // more detection in the data!
    var FireDataData = FirebaseFirestore.instance
        .collection("Tasks")
        .doc("data ${FireCurentUser!.email}")
        .collection("data");
    GetDataOneFirestore();
    itemslenght = Items.length;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        // hour good litle ShadowTasks starts here :)
        theme: ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 64, 66, 201)),
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            // is the button that creates the tasks!
            onPressed: () {
              showDialog(
                  // here it shows the dialog for adding tasks to list
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Add TodoList"),
                      content: TextField(
                        maxLength: 40,
                        onChanged: (String value) {
                          input = value; // aqui es para obtener el data
                          TaskCreator().inputTask = input;
                          String Taskdt = input;
                        },
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                            onPressed: () {
                              if (input == "") {
                                print(
                                    "eres mas tonto que mi perro!"); // IMPORTANT NOTE: Change in production to a alert message!
                              }
                              Navigator.of(context,
                                      rootNavigator:
                                          true) // all of this code is the backend of the task creator!
                                  .pop('dialog');

                              IMarginPosTask = IMarginPosTask + 15;
                              todos.add(InodetaskPos.toString());
                              logic.isTaskCreated = true;
                              TaskNum = TaskNum + 1;
                              tasks.add(input);
                              TaskNameDecider.add(input);
                              Items.add(input);
                              int taskNameDeciderLengh = TaskNameDecider.length;
                              if (isTaskCreated == false) {
                                setState(() {
                                  isTaskCreated = true;
                                });
                              }
                              String taskNameDeciderLenghstr =
                                  taskNameDeciderLengh.toString();
                              FirebaseFirestore.instance
                                  .collection("Tasks")
                                  .doc("user $FireCurentUser list data")
                                  .set({"data": taskNameDeciderLenghstr});
                              TaskPosDecider();
                              //tasks start
                              TaskCreator();
                              Container(
                                height: 50,
                                child: ListView.builder(
                                  itemCount: todos.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    print(todos[index] + "Mal");
                                    return Dismissible(
                                      key: Key(todos[index]),
                                      child: Card(
                                        elevation: 4,
                                        margin: EdgeInsets.only(top: 10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: ListTile(
                                            title: Text(input),
                                            trailing: IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    // para modificar algo despues de borar la task
                                                    todos.removeAt(index);
                                                  });
                                                })),
                                      ),
                                    );
                                  },
                                ),
                              ); // task creator
                              //TODO: add date picker
                              showDialog(
                                  // here is the date picker.
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Material(
                                      child: CalendarDatePicker(
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2070),
                                          onDateChanged:
                                              (DateTime newDateTime) {
                                            setState(() {
                                              dateTwo = newDateTime;
                                              dateOne.add(dateTwo);
                                              InodeTasks = InodeTasks + 1;
                                              int Inodes = Inode++;
                                              istheTaskGoodToApear = true;
                                            });
                                            print(isTaskCreated);
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop('CalendarDatePicker');
                                            dataInode = dataInode + 1;

                                            var FirebaseData = FirebaseFirestore
                                                .instance
                                                .collection("Tasks")
                                                .doc(
                                                    'data ${FireCurentUser!.email}');

                                            if (istheTaskGoodToGo == false) {
                                              setState(() {});
                                            }
                                            if (istheTaskGoodToGo == true) {
                                              FirebaseFirestore.instance
                                                  .collection('Tasks')
                                                  .doc(
                                                      "data ${FireCurentUser!.email}")
                                                  .update({
                                                "data ${DateTime.now()}": input
                                              });
                                            }
                                            showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay(
                                                  hour: DateTime.now().hour,
                                                  minute:
                                                      DateTime.now().minute),
                                              confirmText:
                                                  OnTimeSelectorForTimer(),
                                              cancelText: onTimeCaneled(),
                                            ).then((value) {
                                              setState(() {
                                                doTime = value.toString();
                                                isTheTaskCreationgoodToGo =
                                                    true;
                                              });
                                              dialogToCreateTasks();
                                            });
                                          }),
                                    );
                                  });
                              //TODO: Add hour picker.
                            },
                            child: const Text("Add"))
                      ],
                    );
                  });
              TaskCreator();
              Expanded(
                // here is the tasks creator from firebase
                child: SingleChildScrollView(
                  child: Container(
                      child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: Items.map((strone) {
                      //Basicamente este codigo printea en pantalla cada item de la lista Items automaticamente
                      return Container(
                          child: Text(strone),
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 228, 228, 228)));
                    }).toList(),
                  )),
                ),
              ); // is the graphical interface for them, in production, please remove.
            },
            child: const Icon(
              Icons.add,
              color: Color.fromARGB(255, 228, 228, 228),
            ),
          ),
          body: Container(
            child: Column(
              // frome here the GUI starts!
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(1),
                  child: Column(
                    children: [
                      Align(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: (() => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                menu()))
                                  }),
                              child: Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(top: 30, bottom: 9.8),
                                  child: const Icon(
                                    Icons.menu_sharp,
                                    size: 28.2,
                                    color: Color.fromARGB(212, 255, 255, 255),
                                  )),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 40),
                              child: const Text("ShadowTask",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      shadows: [
                                        Shadow(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          offset: Offset(-6, 6),
                                          blurRadius: 3.6,
                                        ),
                                      ],
                                      color: Color.fromARGB(255, 228, 228, 228),
                                      fontSize: 32)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 40),
                              child: const Icon(
                                Icons.calendar_month_sharp,
                                size: 28.2,
                                color: Color.fromARGB(255, 228, 228, 228),
                              ),
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.only(top: 76),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 156.2,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 228, 228, 228),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(45.0))),
                          child: Align(
                            child: Column(children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width,
                                height: 42.2,
                                child: const Text(
                                  "Tasks",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 33, 33, 33),
                                      fontSize: 24),
                                ),
                              ),
                              if (istheTaskGoodToApear == true) ...[
                                Expanded(
                                  // here is the tasks creator from firebase
                                  child: SingleChildScrollView(
                                    child: Container(
                                        child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      children: Items.map((strone) {
                                        //Basicamente este codigo printea en pantalla cada item de la lista Items automaticamente
                                        return Container(
                                            child: Row(
                                              children: [
                                                Text(strone),
                                                GestureDetector(
                                                  child: Positioned(
                                                      child: Container(
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: const Icon(
                                                        Icons.close_rounded,
                                                        color: Color.fromARGB(
                                                            181, 244, 67, 54),
                                                      ),
                                                    ),
                                                  )),
                                                  onTap: (() {
                                                    FirebaseFirestore.instance
                                                        .collection("Tasks")
                                                        .doc(
                                                            "data ${FireCurentUser!.email}")
                                                        .collection(
                                                            "email ${FireCurentUser!.email}")
                                                        .doc("datases $strone")
                                                        .delete();
                                                    Items.remove(strone);
                                                  }),
                                                ),
                                                GestureDetector(
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: const Icon(
                                                      Icons.check_rounded,
                                                      color: Color.fromARGB(
                                                          203, 76, 175, 79),
                                                    ),
                                                  ),
                                                  onTap: (() {
                                                    isEnded = true;
                                                  }),
                                                )
                                              ],
                                            ),
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(15),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 211, 218, 223)));
                                      }).toList(),
                                    )),
                                  ),
                                ),
                              ],
                              if (isTheTaskCreationgoodToGo == true) ...[],
                              if (isTaskCreated == true &&
                                  isTheTaskNeededToBeReapeted == true) ...[
                                // the GUI for the tasks
                                Container(
                                  margin: EdgeInsets.only(bottom: 53),
                                  width: MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        20,
                                  height: 50,
                                  child: Column(
                                    children: [
                                      SingleChildScrollView(
                                        child: SizedBox(
                                          height:
                                              MediaQuery.of(context).size.height - 225,
                                          child: ListView.builder(
                                              itemCount: taskposdesicder.length,
                                              itemBuilder:
                                                  (BuildContext context, int index) {
                                                return Dismissible(
                                                  key: Key(taskposdesicder[index]),
                                                  // TODO: implementar onDismisabled para borar tasks

                                                  child: Container(
                                                    margin: const EdgeInsets.only(top: 5),
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        20,
                                                    height: 50,
                                                    decoration: const BoxDecoration(
                                                        //este es el decoration
                                                        color: Color.fromARGB(
                                                            255, 211, 218, 223),
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(12.0))),
                                                    child: Text(input)
                                                  ),
                                                  onDismissed: (direction) {
                                                    var FireDatbseDatUid = FirebaseFirestore
                                                        .instance
                                                        .collection("Tasks")
                                                        .doc(
                                                            "data ${FireCurentUser!.email}")
                                                        .collection(input)
                                                        .id;
                                                    setState(() {
                                                      taskposdesicder.removeAt(index);
                                                      FirebaseFirestore.instance
                                                          .collection("Tasks")
                                                          .doc(
                                                              "data ${FireCurentUser!.email}")
                                                          .collection(tasks[index])
                                                          .get()
                                                          .then((value) => {
                                                                for (DocumentSnapshot ds
                                                                    in value.docs)
                                                                  {ds.reference.delete()}
                                                              });
                                                    });
                                                  },
                                                );
                                              }),
                                        ),
                                      ),
                                          Container(
                                            child: Expanded(
                                        // here is the tasks creator from firebase
                                        child: SingleChildScrollView(
                                            child: Container(
                                                child: ListView(
                                              physics: NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              children: Items.map((strone) {
                                                //Basicamente este codigo printea en pantalla cada item de la lista Items automaticamente
                                                return Container(
                                                    child: Row(
                                                      children: [
                                                        Text(strone),
                                                        GestureDetector(
                                                          child: Positioned(
                                                              child: Container(
                                                            child: Container(
                                                              margin: EdgeInsets.all(5),
                                                              alignment:
                                                                  Alignment.centerRight,
                                                              child: const Icon(
                                                                Icons.close_rounded,
                                                                color: Color.fromARGB(
                                                                    181, 244, 67, 54),
                                                              ),
                                                            ),
                                                          )),
                                                          onTap: (() {
                                                            FirebaseFirestore.instance
                                                                .collection("Tasks")
                                                                .doc(
                                                                    "data ${FireCurentUser!.email}")
                                                                .collection(
                                                                    "email ${FireCurentUser!.email}")
                                                                .doc("datases $strone")
                                                                .delete();
                                                            Items.remove(strone);
                                                          }),
                                                        ),
                                                        GestureDetector(
                                                          child: Container(
                                                            margin: EdgeInsets.all(5),
                                                            child: const Icon(
                                                              Icons.check_rounded,
                                                              color: Color.fromARGB(
                                                                  203, 76, 175, 79),
                                                            ),
                                                          ),
                                                          onTap: (() {
                                                            isEnded = true;
                                                          }),
                                                        )
                                                      ],
                                                    ),
                                                    margin: const EdgeInsets.all(5),
                                                    padding: const EdgeInsets.all(15),
                                                    decoration: const BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 211, 218, 223)));
                                              }).toList(),
                                            )),
                                        ),
                                      ),
                                          ),
                                    ],
                                  ),
                                )
                              ],
                              if (isTaskCreated == false) ...[],
                              FutureBuilder<DocumentSnapshot>(
                                future: FirebaseFirestore.instance
                                    .collection("Tasks")
                                    .doc('data ${FireCurentUser!.email}')
                                    .get(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                                  if (snapshot.hasError) {}
                                  if (snapshot.hasData && !snapshot.data!.exists) {}
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    Map<String, dynamic> data = snapshot.data!
                                        .data() as Map<String, dynamic>;
                                    final productsRef = FirebaseFirestore.instance
                                        .collection("Tasks");
                                    productsRef
                                        .doc('data ${FireCurentUser!.email}')
                                        .collection(
                                            "email ${FireCurentUser!.email}")
                                        .get()
                                        .then((QuerySnapshot snapshot) {
                                      if (printed == false) {
                                        setState(() {
                                          istheTaskGoodToApear = true;
                                          printed = true;
                                        });
                                        snapshot.docs
                                            .forEach((DocumentSnapshot doc) {
                                          readdata.add(
                                              doc.data() as Map<String, dynamic>);
                                        });
                                      }
                                      if (snapshot.docs == null) {
                                        throw Exception();
                                      }
                                      if (readdata == null) {
                                        throw Exception();
                                      }
                                      for (Map<String, dynamic> item in readdata) {
                                        if (readdata == null) {
                                          throw Exception();
                                        }
                                        if (item == null) {
                                          throw Exception();
                                        }
                                        Items.add(item['data'].toString());
                                      }
                                    });
                                  }
                                  if (snapshot.hasData == true) {}

                                  bool isdataIkGoodToGo = false;
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    Map<String, dynamic> data = snapshot.data!
                                        .data() as Map<String, dynamic>;
                                    DataSS = data;
                                  }
                                  return Text("");
                                },
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  onTimeCaneled() {}

  dialogToCreateTasks() {
    showDialog(
        context: context,
        builder: (BuildContext contex) {
          return AlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width - 100,
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                children: [
                  Container(
                    child: Text("Do you want to repeat the task?"),
                  ),
                  Container(
                    child: Text(WhatIstheTaskGoingToDo),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Text("Yes"),
                    ),
                    onTap: (() {
                      setState(() {
                        isthetaskgoingtobeReapeted = true;
                        WhatIstheTaskGoingToDo = "Your Task will be reapeted!";
                      });
                    }),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Text("No"),
                    ),
                    onTap: (() {
                      setState(() {
                        WhatIstheTaskGoingToDo =
                            "Okay, your task wont be reapeted!";
                      });
                    }),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Text("Select when to reapeat"),
                    ),
                    onTap: (() {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => CupertinoActionSheet(
                          title: const Text('Choose Options'),
                          message: const Text('Your options are '),
                          actions: <Widget>[
                            CupertinoActionSheetAction(
                              child: const Text('5 mins'),
                              onPressed: () {
                                setState(() {
                                  HowMuchTimeWillItBeNotified = 5;
                                });
                                Navigator.pop(context, '5 mins');
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text('10 mins'),
                              onPressed: () {
                                setState(() {
                                  HowMuchTimeWillItBeNotified = 10;
                                });
                                Navigator.pop(context, '10 mins');
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text('30 mins'),
                              onPressed: () {
                                setState(() {
                                  HowMuchTimeWillItBeNotified = 30;
                                });
                                Navigator.pop(context, '30 mins');
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                              title: Text("YES"),
                              leading: Radio<choice>(
                                value: choice.falso,
                                groupValue: elecciones,
                                onChanged: (choice? value) {
                                  setState(() {
                                    elecciones = value;
                                  });
                                },
                              )),
                        ),
                        Expanded(
                          child: ListTile(
                              title: Text("NO"),
                              leading: Radio<choice>(
                                value: choice.verdadero,
                                groupValue: elecciones,
                                onChanged: (choice? value) {
                                  setState(() {
                                    elecciones = value;
                                  });
                                },
                              )),
                        ),
                        FloatingActionButton(
                          child: Text("Accept"),
                          onPressed: (() {
                            var FireDatbseDat = FirebaseFirestore.instance
                                .collection("Tasks")
                                .doc("data ${FireCurentUser!.email}")
                                .collection("email ${FireCurentUser!.email}")
                                .doc("datases $input")
                                .set({
                              "data": input,
                              "Do Day": dateTwo,
                              "Do Time": doTime,
                              "ended": isEnded,
                              "repeat": isTaskGoingToBeReapeted,
                              "Time before notification":
                                  HowMuchTimeWillItBeNotified
                            });
                            FirebaseFirestore.instance
                                .collection("Tasks")
                                .doc('data ${FireCurentUser!.email}')
                                .set({
                              "data": input,
                              "Do Day": dateTwo,
                              "Do Time": doTime,
                              "ended": isEnded,
                              "repeat": isTaskGoingToBeReapeted,
                              "Time before notification":
                                  HowMuchTimeWillItBeNotified
                            });
                          }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  OnTimeSelectorForTimer() {}

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  printDataTask() {
    Expanded(
      // here is the tasks creator from firebase
      child: SingleChildScrollView(
        child: Container(
            child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: Items.map((strone) {
            //Basicamente este codigo printea en pantalla cada item de la lista Items automaticamente
            return Container(
                child: Text(strone),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(15),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 228, 228, 228)));
          }).toList(),
        )),
      ),
    );
  }

  datetimer() {
    CupertinoDatePicker(
      mode: CupertinoDatePickerMode.dateAndTime,
      onDateTimeChanged: (value) {
        setState(() {
          timer = value;
        });
      },
      initialDateTime: DateTime.now(),
    );
  }

  doNotRepeatTasks() {
    isTaskGoingToBeReapeted = true;
  }

  firedatagetone() {
    var datas = FirebaseFirestore.instance
        .collection("Tasks")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        FirebaseFirestore.instance
            .doc('data ${FireCurentUser!.email}')
            .collection(doc.id)
            .get();
      });
    });
    print(datas.toString());
  }

  Widget headerItem() {
    return ListTile(
        title: Text(
      'Tasks',
      style: TextStyle(color: Colors.blue),
    ));
  }

  _fetchUserDataFireStore() async {
    var FireVBaseDataOne;
    final FireDataOne = FirebaseFirestore.instance
        .collection("Tasks")
        .doc("data ${FireCurentUser!.email}")
        .get();
    print(FireDataOne.toString());
  }

  dataFi() async {
    var dataF = await FirebaseFirestore.instance
        .collection("Tasks")
        .doc("data ${FireCurentUser!.email}")
        .get();
    Stream<QuerySnapshot> stream =
        await FirebaseFirestore.instance.collection("Tasks").snapshots();
  }

  WaitForDataToApear() async {
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        istheTaskGoodToApear = true;
      });
    });
  }

  DataToGetForOnes() {
    var dataOdbwe = FirebaseFirestore.instance
        .collection('Tasks')
        .where('uid')
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                DataIDTasks = element.id;
                var FireDatbseDat = FirebaseFirestore.instance
                    .collection("Tasks")
                    .doc("data ${FireCurentUser!.email}")
                    .collection("id: ${element.id}")
                    .add({"Task": input});
                FirebaseFirestore.instance
                    .collection("Tasks")
                    .doc("data ${FireCurentUser!.email}")
                    .set({"data": TaskNameDecider});
              })
            });
  }

  taskToBeReapeted() {
    isTaskGoingToBeReapeted = true;
  }

  DisplaydataFromfire() {
    print("mal");
    for (int i = 0; i < Items.length; i++) {
      print(Items[i]);
      Text(Items[i]);
    }
  }

  GetDataOneFirestore() {
    FutureBuilder<DocumentSnapshot>(
      future: _collectionRef.doc("data ${FireCurentUser!.email}").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          print("muy mal");
          return Text("");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          print("mal");
          return Text("");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print(data);
          return Text("");
        }

        return Text("");
      },
    );
  }
}

class CreatTaskBtnBody extends StatelessWidget {
  const CreatTaskBtnBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List dateOne = [];
    String dateTwo = "";
    String input = "";
    return Scaffold();
  }
}

void TaskPosCreator() {
  while (logic.isTaskCreated == true) {
    return TaskPosCreator();
  }
}
