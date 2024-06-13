import 'package:flutter/material.dart';

class Typetask {
  // si lo ejecutas, te devuelve bg color, text color y el shadow color; si es el caso elimina una task
  late bool ended;
  late DateTime time;
  late String task;
  late TimeOfDay hour;

  late Color bgcolor;
  late Color fontcolor;
  late Color shadowcolor;
  late String dotime;
  late bool delete;
  late double width1;

  DateTime curentdate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime curenthour = DateTime(DateTime.now().hour, DateTime.now().minute);
  Typetask(
    bool ended,
    DateTime time,
    TimeOfDay hour,
    String task,
    double width,
  ) {
    this.task = task;
    this.ended = ended;
    this.time = time;
    this.hour = hour;
    this.width1 = width;
    if (ended == false) {
      if (time.compareTo(curentdate) < 0) {
        this.bgcolor = Color.fromARGB(186, 228, 228, 228);
        this.fontcolor = Color.fromARGB(180, 66, 69, 73);
        this.shadowcolor = Color.fromARGB(78, 0, 0, 0);
        this.dotime = this.time.toString();
        this.delete = false;
        //return (Color.fromARGB(186, 228, 228, 228), Color.fromARGB(180, 66, 69, 73),Color.fromARGB(78, 0, 0, 0),this.time);
      } else if (time.compareTo(curentdate) == 0) {
        this.bgcolor = Color.fromARGB(186, 228, 228, 228);
        this.fontcolor = Color.fromARGB(180, 66, 69, 73);
        this.shadowcolor = Color.fromARGB(78, 0, 0, 0);
        this.dotime = this.hour.toString();
        this.delete = false;
        //return (Color.fromARGB(186, 228, 228, 228), Color.fromARGB(180, 66, 69, 73),Color.fromARGB(78, 0, 0, 0),this.hour);
      } else {
        this.bgcolor = Color.fromARGB(205, 255, 10, 26);
        this.fontcolor = Colors.white;
        this.shadowcolor = Colors.grey;
        this.dotime = this.time.toString();
        this.delete = false;
        //return (Color.fromARGB(172, 6, 255, 6),Colors.white,Colors.grey,);
      }
    }
    if (ended == true) {
      if (time.compareTo(curentdate) > 0) {
        this.delete = true;
      } else {
        this.bgcolor = Color.fromARGB(172, 6, 255, 6);
        this.fontcolor = Colors.white;
        this.shadowcolor = Colors.grey;
        this.dotime = this.time.toString();
        this.delete = false;
      }
    }
  }

  void plottask() {
    if (delete != true) {
      Center(
        child: Container(
          height: 80.0,
          width: width1 - 60,
          decoration: BoxDecoration(
            color: bgcolor,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: kElevationToShadow[24],
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 5.2,
              ),
              Center(
                child: Text(
                  '${task}',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2.4,
                    //color: Color.fromARGB(200, 66, 69, 73),
                    color: fontcolor,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        color: shadowcolor,
                        blurRadius: 4.2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  ' Limit time: ${dotime}',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2.4,
                    //color: Color.fromARGB(180, 66, 69, 73),
                    color: fontcolor,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      //eliminar las task del firebase
    }
  }
}
