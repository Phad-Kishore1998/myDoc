import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen2> {
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() { 
      print("completed");
      setState(() {});
    });
  }
  String employeeName, employeeid, glucose, age, heartpulse, oxygensaturation, breathsperminute;

  getHeartPulse(heartpulse) {
    this.heartpulse = heartpulse;
  }

  getOxygenSaturation(oxygensaturation) {
    this.oxygensaturation = oxygensaturation;
  }

  getBreathsPerMinute(breathsperminute) {
    this.breathsperminute = breathsperminute;
  }

  getEmployeeName(name) {
    this.employeeName = name;
  }

  getEmployeeID(id) {
    this.employeeid = id;
  }

  getAge(age) {
    this.age = age;
  }

  getGlucose(glucose) {
    this.glucose = glucose;
  }

  createData() {
    //print("Created");
  
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyEmployee").doc("Report");
    //create map
    Map<String, dynamic> employees = {
      "Name": employeeName,
      "Age": age,
      "EmployeeID": employeeid,
      "Glucose": glucose,
      "HeartPulse": heartpulse,
      "Oxygen_Saturation": oxygensaturation,
      "Breaths_per_minute": breathsperminute,
    };

    documentReference.set(employees).whenComplete(() {
      print("$employeeName created");
    });

  }


  updateData() {
    print("Update");

    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyEmployee").doc("Report");
    //create map
    Map<String, dynamic> employees = {
      "Name": employeeName,
      "Age": age,
      "EmployeeID": employeeid,
      "Glucose": glucose,
      "HeartPulse": heartpulse,
      "Oxygen_Saturation": oxygensaturation,
      "Breaths_per_minute": breathsperminute,
    };

    documentReference.set(employees).whenComplete(() {
      print("$employeeName updated");
    });

  }

  deleteData() {
    print("Deleted");
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyEmployee").doc("Report");
    documentReference.delete().whenComplete(() {
      print("$employeeName deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body:
      SingleChildScrollView(
       child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String name) {
                  getEmployeeName(name);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "EmployeeID",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String id) {
                  getEmployeeID(id);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Age",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String age) {
                  getAge(age);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Glucose",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String glucose) {
                  getGlucose(glucose);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Oxygen Saturation",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String oxygensaturation) {
                  getOxygenSaturation(oxygensaturation);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Heart Pulse",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String heartpulse) {
                  getHeartPulse(heartpulse);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Breaths per Minute",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String breathsperminute) {
                  getBreathsPerMinute(breathsperminute);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text("Create"),
                  textColor: Colors.green,
                  onPressed: () {
                    createData();
                  },
                ),
              
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text("Update"),
                  textColor: Colors.orange,
                  onPressed: () {
                    updateData();
                  },
                ),
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text("Delete"),
                  textColor: Colors.red,
                  onPressed: () {
                    deleteData();
                  },
                )
              ],
            ),
           
           
          ],
        ),
      ),
      )
    );
  }
}