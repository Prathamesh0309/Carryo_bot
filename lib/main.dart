import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:carryo_bot/home_test.dart';
import 'package:carryo_bot/login.dart';
import 'package:carryo_bot/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'home': (context) => MyHomePage()
    },
  ));
}
