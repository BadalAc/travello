import 'package:flutter/material.dart';
import 'package:travello/screens/destination_detail.dart';
import 'package:travello/screens/home.dart';
import 'package:travello/screens/sign_in.dart';

void main() {
  runApp(MaterialApp(
    home: Main(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      accentColor: Color(0xffDC143C)
    ),
  ));
}

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}