import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Home_card(),
    );
  }
}

class Home_card extends StatefulWidget {
  const Home_card({Key? key}) : super(key: key);

  @override
  _Home_cardState createState() => _Home_cardState();
}

class _Home_cardState extends State<Home_card> {
  final items = ['Item 1', 'Item 2'];
  String? value;
  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);

        timeBackPressed = DateTime.now();

        if (isExitWarning) {
          final message = 'Press back again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 20);
          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Center(
        child: Card(
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text(
                  'Call the bot',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: DropdownButton<String>(
                      value: value,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Call",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 20),
        ),
      );
}
