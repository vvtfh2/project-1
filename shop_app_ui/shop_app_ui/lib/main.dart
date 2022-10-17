import 'package:flutter/material.dart';
import 'pages/HomePage.dart';
import 'pages/ItemPage.dart';
import 'pages/LoginPage.dart';
import 'pages/RegisterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        "homePage" : (context) => HomePage(),
        "registerPage" : (context) => RegisterPage(),
        "loginPage" : (context) => LoginPage(),
        ItemPage.nameRoute: (context) => const ItemPage(),
      },
    );
  }
}
