import 'package:carryo_bot/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedfaculty, selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: new ListView(
          children: <Widget>[
            // new Card(
            //   elevation: 10,
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: <Widget>[
            // const ListTile(
            Column(
              children: <Widget>[
                Text(
                  'Call the bot',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Faculty_Name")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    const Text("Loading.....");
                  else {
                    List<DropdownMenuItem> facultyName = [];
                    for (int i = 0; i < snapshot.data!.docs.length; i++) {
                      DocumentSnapshot snap = snapshot.data!.docs[i];

                      facultyName.add(
                        DropdownMenuItem(
                          child: Text(
                            snap.id,
                          ),
                          value: "${snap.id}",
                        ),
                      );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DropdownButton<dynamic>(
                          items: facultyName,
                          onChanged: (facName) {
                            final snackBar = SnackBar(
                              content: Text(
                                '$facName Selected',
                              ),
                            );
                            Scaffold.of(context).showSnackBar(snackBar);
                            setState(() {
                              selectedfaculty = facName;
                            });
                          },
                          value: selectedfaculty,
                          isExpanded: false,
                          hint: new Text(
                            "Choose faculty name",
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Call",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    );
                  }
                  return (SizedBox());
                }),
          ],
        ),
      ),
    );
  }
}

  // updateData(String name, String gender, int score, String userID) async {
  //   await DatabaseManager().updateUserList(name, gender, score, userID);
  //   fetchDatabaseList();
  // }

